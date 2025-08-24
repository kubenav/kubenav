package kubenav

import (
	"context"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	v4 "github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/credentials/stscreds"
	"github.com/aws/aws-sdk-go-v2/service/eks"
	"github.com/aws/aws-sdk-go-v2/service/eks/types"
	"github.com/aws/aws-sdk-go-v2/service/sso"
	"github.com/aws/aws-sdk-go-v2/service/ssooidc"
	"github.com/aws/aws-sdk-go-v2/service/sts"
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
func AWSGetClusters(accessKeyID, secretKey, region, sessionToken, roleArn string) (_ string, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("panic: %#v", r)
		}
	}()

	ctx := context.Background()
	cred := credentials.NewStaticCredentialsProvider(accessKeyID, secretKey, sessionToken)

	sess, err := config.LoadDefaultConfig(ctx, config.WithRegion(region), config.WithCredentialsProvider(cred))
	if err != nil {
		return "", err
	}

	if roleArn != "" {
		stsSvc := sts.NewFromConfig(sess)
		creds := stscreds.NewAssumeRoleProvider(stsSvc, roleArn)
		sess.Credentials = aws.NewCredentialsCache(creds)
	}

	eksClient := eks.NewFromConfig(sess)

	var clusters []*types.Cluster
	var names []string
	var nextToken *string

	for {
		c, err := eksClient.ListClusters(ctx, &eks.ListClustersInput{NextToken: nextToken})
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
		cluster, err := eksClient.DescribeCluster(ctx, &eks.DescribeClusterInput{Name: &name})
		if err != nil {
			return "", err
		}

		if cluster.Cluster.Status == types.ClusterStatusActive {
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
func AWSGetToken(accessKeyID, secretKey, region, sessionToken, roleArn, clusterID string) (_ string, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("panic: %#v", r)
		}
	}()

	ctx := context.Background()

	cred := credentials.NewStaticCredentialsProvider(accessKeyID, secretKey, sessionToken)

	sess, err := config.LoadDefaultConfig(ctx, config.WithRegion(region), config.WithCredentialsProvider(cred))
	if err != nil {
		return "", err
	}

	if roleArn != "" {
		stsSvc := sts.NewFromConfig(sess)
		creds := stscreds.NewAssumeRoleProvider(stsSvc, roleArn)
		sess.Credentials = aws.NewCredentialsCache(creds)
	}

	stsClient := sts.NewFromConfig(sess)
	presignclient := sts.NewPresignClient(stsClient)

	out, err := presignclient.PresignGetCallerIdentity(ctx, &sts.GetCallerIdentityInput{}, func(opt *sts.PresignOptions) {
		opt.Presigner = newCustomHTTPPresignerV4(opt.Presigner, map[string]string{
			"x-k8s-aws-id":  clusterID,
			"x-amz-expires": "60",
		})
	})
	if err != nil {
		return "", err
	}

	return fmt.Sprintf("k8s-aws-v1.%s", base64.RawStdEncoding.EncodeToString([]byte(out.URL))), nil
}

// AWSGetSSOConfig registers a new AWS SSO client and starts the device
// authentication. The client and device authentication is returned, so that we
// can use the information in the following steps of the SSO flow.
func AWSGetSSOConfig(ssoRegion, startURL string) (_ string, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("panic: %#v", r)
		}
	}()

	ctx := context.Background()
	clientName := "kubenav"
	clientType := "public"

	svc := ssooidc.NewFromConfig(aws.Config{Region: ssoRegion})

	registeredClient, err := svc.RegisterClient(ctx, &ssooidc.RegisterClientInput{
		ClientName: &clientName,
		ClientType: &clientType,
	})
	if err != nil {
		return "", err
	}

	startDeviceAuth, err := svc.StartDeviceAuthorization(ctx, &ssooidc.StartDeviceAuthorizationInput{
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
func AWSGetSSOToken(accountID, roleName, ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode, accessToken string, accessTokenExpire int64) (_ string, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("panic: %#v", r)
		}
	}()

	ctx := context.Background()
	grantType := "urn:ietf:params:oauth:grant-type:device_code"

	if accessToken != "" {
		if accessTokenExpire < (time.Now().Unix()-60)*1000 {
			return "", fmt.Errorf("aws_sso_access_token_is_expired")
		}
	} else {
		svcssooidc := ssooidc.NewFromConfig(aws.Config{Region: ssoRegion})

		token, err := svcssooidc.CreateToken(ctx, &ssooidc.CreateTokenInput{
			ClientId:     &ssoClientID,
			ClientSecret: &ssoClientSecret,
			DeviceCode:   &ssoDeviceCode,
			GrantType:    &grantType,
		})
		if err != nil {
			return "", err
		}

		accessToken = *token.AccessToken
		accessTokenExpire = (time.Now().Unix() + int64(token.ExpiresIn)) * 1000
	}

	svcsso := sso.NewFromConfig(aws.Config{Region: ssoRegion})

	creds, err := svcsso.GetRoleCredentials(ctx, &sso.GetRoleCredentialsInput{
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
		Expire:            creds.RoleCredentials.Expiration,
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
func AWSGetSSOAccounts(ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode string) (_ string, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("panic: %#v", r)
		}
	}()

	ctx := context.Background()
	grantType := "urn:ietf:params:oauth:grant-type:device_code"

	svcssooidc := ssooidc.NewFromConfig(aws.Config{Region: ssoRegion})

	token, err := svcssooidc.CreateToken(ctx, &ssooidc.CreateTokenInput{
		ClientId:     &ssoClientID,
		ClientSecret: &ssoClientSecret,
		DeviceCode:   &ssoDeviceCode,
		GrantType:    &grantType,
	})
	if err != nil {
		return "", err
	}

	accessToken := *token.AccessToken
	accessTokenExpire := (time.Now().Unix() + int64(token.ExpiresIn)) * 1000

	svcsso := sso.NewFromConfig(aws.Config{Region: ssoRegion})

	accounts, err := svcsso.ListAccounts(ctx, &sso.ListAccountsInput{
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
		roles, err := svcsso.ListAccountRoles(ctx, &sso.ListAccountRolesInput{
			AccountId:   account.AccountId,
			AccessToken: &accessToken,
		})
		if err != nil {
			return "", err
		}

		var ssoRoles []string

		if roles != nil {
			for _, role := range roles.RoleList {
				if role.RoleName != nil {
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

type customHTTPPresignerV4 struct {
	client  sts.HTTPPresignerV4
	headers map[string]string
}

func newCustomHTTPPresignerV4(client sts.HTTPPresignerV4, headers map[string]string) sts.HTTPPresignerV4 {
	return &customHTTPPresignerV4{
		client:  client,
		headers: headers,
	}
}

func (p *customHTTPPresignerV4) PresignHTTP(
	ctx context.Context, credentials aws.Credentials, r *http.Request,
	payloadHash string, service string, region string, signingTime time.Time,
	optFns ...func(*v4.SignerOptions),
) (url string, signedHeader http.Header, err error) {
	for key, val := range p.headers {
		r.Header.Add(key, val)
	}
	return p.client.PresignHTTP(ctx, credentials, r, payloadHash, service, region, signingTime, optFns...)
}
