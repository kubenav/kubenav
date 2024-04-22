package kubenav

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"time"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/credentials/stscreds"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/eks"
	"github.com/aws/aws-sdk-go/service/sso"
	"github.com/aws/aws-sdk-go/service/ssooidc"
	"github.com/aws/aws-sdk-go/service/sts"
)

// AWSSSOConfig is the structure of the returned data from the AWS SSO config
// call. It contains the client and the registered device, which can be used to
// continue with the sso flow.
type AWSSSOConfig struct {
	Client ssooidc.RegisterClientOutput           `json:"client"`
	Device ssooidc.StartDeviceAuthorizationOutput `json:"device"`
}

// AWSSSOCredentials is the structure of the AWS credentials generated via AWS
// SSO.
type AWSSSOCredentials struct {
	AccessKeyID       string `json:"accessKeyId"`
	SecretAccessKey   string `json:"secretAccessKey"`
	SessionToken      string `json:"sessionToken"`
	Expire            int64  `json:"expire"`
	Region            string `json:"region"`
	SSORegion         string `json:"ssoRegion"`
	StartURL          string `json:"startURL"`
	AccountID         string `json:"accountID"`
	RoleName          string `json:"roleName"`
	AccessToken       string `json:"accessToken"`
	AccessTokenExpire int64  `json:"accessTokenExpire"`
}

// AWSSSOAccount represents a single AWS SSO account with it's name and id and
// all the available roles for an authenticated user. It also contains the
// access token and expire timestamp which was generated to get the account, so
// that they can be used to get the sso credentials in a follow up API call.
type AWSSSOAccount struct {
	AccountID         string   `json:"accountId"`
	AccountName       string   `json:"accountName"`
	Roles             []string `json:"roles"`
	AccessToken       string   `json:"accessToken"`
	AccessTokenExpire int64    `json:"accessTokenExpire"`
}

// AWSGetClusters returns all clusters which can be accessed with the given
// credentials.
func AWSGetClusters(accessKeyID, secretKey, region, sessionToken, roleArn string) (string, error) {
	var clusters []*eks.Cluster
	var names []*string
	var nextToken *string

	cred := credentials.NewStaticCredentials(accessKeyID, secretKey, sessionToken)

	sess, err := session.NewSession(&aws.Config{Region: aws.String(region), Credentials: cred})
	if err != nil {
		return "", err
	}

	if roleArn != "" {
		cred = stscreds.NewCredentials(sess, roleArn)
	}

	eksClient := eks.New(sess, &aws.Config{Credentials: cred})

	for {
		c, err := eksClient.ListClusters(&eks.ListClustersInput{NextToken: nextToken})
		if err != nil {
			return "", err
		}

		names = append(names, c.Clusters...)

		if c.NextToken == nil {
			break
		}

		nextToken = c.NextToken
	}

	for _, name := range names {
		cluster, err := eksClient.DescribeCluster(&eks.DescribeClusterInput{Name: name})
		if err != nil {
			return "", err
		}

		if *cluster.Cluster.Status == eks.ClusterStatusActive {
			clusters = append(clusters, cluster.Cluster)
		}
	}

	clustersBytes, err := json.Marshal(clusters)
	if err != nil {
		return "", err
	}

	return string(clustersBytes), nil
}

// AWSGetToken returns a token, which can be used to access the Kubernetes API
// of a cluster with the given clusterID.
// See: https://github.com/kubernetes-sigs/aws-iam-authenticator/blob/7547c74e660f8d34d9980f2c69aa008eed1f48d0/pkg/token/token.go#L310
func AWSGetToken(accessKeyID, secretKey, region, sessionToken, roleArn, clusterID string) (string, error) {
	cred := credentials.NewStaticCredentials(accessKeyID, secretKey, sessionToken)

	sess, err := session.NewSession(&aws.Config{Region: aws.String(region), Credentials: cred})
	if err != nil {
		return "", err
	}

	if roleArn != "" {
		cred = stscreds.NewCredentials(sess, roleArn)
	}

	stsClient := sts.New(sess, &aws.Config{Credentials: cred})

	request, _ := stsClient.GetCallerIdentityRequest(&sts.GetCallerIdentityInput{})
	request.HTTPRequest.Header.Add("x-k8s-aws-id", clusterID)
	presignedURLString, err := request.Presign(60)
	if err != nil {
		return "", err
	}

	return fmt.Sprintf("k8s-aws-v1.%s", base64.RawURLEncoding.EncodeToString([]byte(presignedURLString))), nil
}

// AWSGetSSOConfig registers a new AWS SSO client and starts the device
// authentication. The client and device authentication is returned, so that we
// can use the information in the following steps of the SSO flow.
func AWSGetSSOConfig(ssoRegion, startURL string) (string, error) {
	clientName := "kubenav"
	clientType := "public"

	sess, err := session.NewSession()
	if err != nil {
		return "", err
	}

	svc := ssooidc.New(sess, aws.NewConfig().WithRegion(ssoRegion))

	registeredClient, err := svc.RegisterClient(&ssooidc.RegisterClientInput{
		ClientName: &clientName,
		ClientType: &clientType,
	})
	if err != nil {
		return "", err
	}

	startDeviceAuth, err := svc.StartDeviceAuthorization(&ssooidc.StartDeviceAuthorizationInput{
		ClientId:     registeredClient.ClientId,
		ClientSecret: registeredClient.ClientSecret,
		StartUrl:     &startURL,
	})
	if err != nil {
		return "", err
	}

	ssoConfig, err := json.Marshal(AWSSSOConfig{
		Client: *registeredClient,
		Device: *startDeviceAuth,
	})
	if err != nil {
		return "", err
	}

	return string(ssoConfig), nil
}

// AWSGetSSOToken is used to request a new token with the client and device
// information from the former step in the sso flow. The retrieved access token
// is then used to get the credentials for AWS.
func AWSGetSSOToken(accountID, roleName, ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode, accessToken string, accessTokenExpire int64) (string, error) {
	grantType := "urn:ietf:params:oauth:grant-type:device_code"

	sess, err := session.NewSession()
	if err != nil {
		return "", err
	}

	if accessToken != "" {
		if accessTokenExpire < (time.Now().Unix()-60)*1000 {
			return "", fmt.Errorf("aws_sso_access_token_is_expired")
		}
	} else {
		svcssooidc := ssooidc.New(sess, aws.NewConfig().WithRegion(ssoRegion))

		token, err := svcssooidc.CreateToken(&ssooidc.CreateTokenInput{
			ClientId:     &ssoClientID,
			ClientSecret: &ssoClientSecret,
			DeviceCode:   &ssoDeviceCode,
			GrantType:    &grantType,
		})
		if err != nil {
			return "", err
		}

		accessToken = *token.AccessToken
		accessTokenExpire = (time.Now().Unix() + *token.ExpiresIn) * 1000
	}

	svcsso := sso.New(sess, aws.NewConfig().WithRegion(ssoRegion))

	creds, err := svcsso.GetRoleCredentials(&sso.GetRoleCredentialsInput{
		AccessToken: &accessToken,
		AccountId:   &accountID,
		RoleName:    &roleName,
	})
	if err != nil {
		return "", err
	}

	ssoCredentials, err := json.Marshal(AWSSSOCredentials{
		AccessKeyID:       *creds.RoleCredentials.AccessKeyId,
		SecretAccessKey:   *creds.RoleCredentials.SecretAccessKey,
		SessionToken:      *creds.RoleCredentials.SessionToken,
		Expire:            *creds.RoleCredentials.Expiration,
		AccessToken:       accessToken,
		AccessTokenExpire: accessTokenExpire,
	})
	if err != nil {
		return "", err
	}

	return string(ssoCredentials), nil
}

// AWSGetSSOAccounts returns a list of accounts and roles for the currently
// authenticated user, so that a user does not have to provide these information
// by his own.
func AWSGetSSOAccounts(ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode string) (string, error) {
	grantType := "urn:ietf:params:oauth:grant-type:device_code"

	sess, err := session.NewSession()
	if err != nil {
		return "", err
	}

	svcssooidc := ssooidc.New(sess, aws.NewConfig().WithRegion(ssoRegion))

	token, err := svcssooidc.CreateToken(&ssooidc.CreateTokenInput{
		ClientId:     &ssoClientID,
		ClientSecret: &ssoClientSecret,
		DeviceCode:   &ssoDeviceCode,
		GrantType:    &grantType,
	})
	if err != nil {
		return "", err
	}

	accessToken := *token.AccessToken
	accessTokenExpire := (time.Now().Unix() + *token.ExpiresIn) * 1000

	svcsso := sso.New(sess, aws.NewConfig().WithRegion(ssoRegion))

	accounts, err := svcsso.ListAccounts(&sso.ListAccountsInput{
		AccessToken: &accessToken,
	})
	if err != nil {
		return "", err
	}

	if accounts == nil || accounts.AccountList == nil {
		return "", fmt.Errorf("no accounts were found")
	}

	var ssoAccounts []AWSSSOAccount

	for _, account := range accounts.AccountList {
		roles, err := svcsso.ListAccountRoles(&sso.ListAccountRolesInput{
			AccountId:   account.AccountId,
			AccessToken: &accessToken,
		})
		if err != nil {
			return "", err
		}

		var ssoRoles []string

		if roles != nil {
			for _, role := range roles.RoleList {
				if role != nil && role.RoleName != nil {
					ssoRoles = append(ssoRoles, *role.RoleName)
				}
			}

		}

		ssoAccounts = append(ssoAccounts, AWSSSOAccount{
			AccountID:         *account.AccountId,
			AccountName:       *account.AccountName,
			Roles:             ssoRoles,
			AccessToken:       accessToken,
			AccessTokenExpire: accessTokenExpire,
		})
	}

	ssoAccountsBytes, err := json.Marshal(ssoAccounts)
	if err != nil {
		return "", err
	}

	return string(ssoAccountsBytes), nil
}
