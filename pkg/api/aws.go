package api

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/kubenav/kubenav/pkg/api/middleware"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/eks"
	"github.com/aws/aws-sdk-go/service/sso"
	"github.com/aws/aws-sdk-go/service/ssooidc"
	"github.com/aws/aws-sdk-go/service/sts"
)

// AWSRequest is the structure of an request for one of the AWS methods.
type AWSRequest struct {
	AccessKeyID     string `json:"accessKeyId"`
	SecretAccessKey string `json:"secretAccessKey"`
	SessionToken    string `json:"sessionToken"`
	Region          string `json:"region"`
	ClusterID       string `json:"clusterID"`
}

// AWSTokenResponse is the structure to return an Token for AWS.
type AWSTokenResponse struct {
	Token string `json:"token"`
}

// AWSSSOConfig is the structure to return the configuration for AWS SSO.
type AWSSSOConfig struct {
	AWSSSOCredentials
	Client ssooidc.RegisterClientOutput           `json:"client"`
	Device ssooidc.StartDeviceAuthorizationOutput `json:"device"`
}

// AWSSSOCredentials returns AWS credentials generated via AWS SSO.
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
	ClusterID         string `json:"clusterID"`
}

// awsGetClustersHandler returns all EKS clusters from AWS. The user have to provide an access key id, a secret
// access key and a region. With these credentials we are creating an new EKS client and we are loading all clusters for
// the specified region.
func (c *Client) awsGetClustersHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var awsRequest AWSRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&awsRequest)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	var clusters []*eks.Cluster
	var names []*string
	var nextToken *string

	cred := credentials.NewStaticCredentials(awsRequest.AccessKeyID, awsRequest.SecretAccessKey, awsRequest.SessionToken)

	sess, err := session.NewSession(&aws.Config{Region: aws.String(awsRequest.Region), Credentials: cred})
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create new AWS session: %s", err.Error()))
		return
	}

	eksClient := eks.New(sess)

	for {
		c, err := eksClient.ListClusters(&eks.ListClustersInput{NextToken: nextToken})
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not list EKS clusters: %s", err.Error()))
			return
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
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not cluster details: %s", err.Error()))
			return
		}

		if *cluster.Cluster.Status == eks.ClusterStatusActive {
			clusters = append(clusters, cluster.Cluster)
		}
	}

	middleware.Write(w, r, clusters)
	return
}

// awsGetTokenHandler returns a bearer token for which then can be used for a request against the Kubernetes API.
// See: https://github.com/kubernetes-sigs/aws-iam-authenticator/blob/7547c74e660f8d34d9980f2c69aa008eed1f48d0/pkg/token/token.go#L310
func (c *Client) awsGetTokenHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var awsRequest AWSRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&awsRequest)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	cred := credentials.NewStaticCredentials(awsRequest.AccessKeyID, awsRequest.SecretAccessKey, awsRequest.SessionToken)

	sess, err := session.NewSession(&aws.Config{Region: aws.String(awsRequest.Region), Credentials: cred})
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create new AWS session: %s", err.Error()))
		return
	}

	stsClient := sts.New(sess)

	request, _ := stsClient.GetCallerIdentityRequest(&sts.GetCallerIdentityInput{})
	request.HTTPRequest.Header.Add("x-k8s-aws-id", awsRequest.ClusterID)
	presignedURLString, err := request.Presign(60)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create presigned URL: %s", err.Error()))
		return
	}

	awsTokenResponse := AWSTokenResponse{
		Token: fmt.Sprintf("k8s-aws-v1.%s", base64.RawURLEncoding.EncodeToString([]byte(presignedURLString))),
	}

	middleware.Write(w, r, awsTokenResponse)
	return
}

// awsGetSSOConfigHandler registers a new client and starts the device authentication. The client and device
// authentication is returned, so that we can use the information in the following steps of the SSO flow.
func (c *Client) awsGetSSOConfigHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var awsRequest AWSSSOConfig
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&awsRequest)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	sess, err := session.NewSession()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create new AWS session: %s", err.Error()))
		return
	}

	svc := ssooidc.New(sess, aws.NewConfig().WithRegion(awsRequest.SSORegion))

	registeredClient, err := svc.RegisterClient(&ssooidc.RegisterClientInput{
		ClientName: stringPointer("kubenav"),
		ClientType: stringPointer("public"),
	})
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not register new client: %s", err.Error()))
		return
	}

	startDeviceAuth, err := svc.StartDeviceAuthorization(&ssooidc.StartDeviceAuthorizationInput{
		ClientId:     registeredClient.ClientId,
		ClientSecret: registeredClient.ClientSecret,
		StartUrl:     &awsRequest.StartURL,
	})
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not start device authorization: %s", err.Error()))
		return
	}

	middleware.Write(w, r, AWSSSOConfig{
		Client: *registeredClient,
		Device: *startDeviceAuth,
	})
	return
}

// awsGetSSOTokenHandler requests a new token with the client and device information from the former step. The retrieved
// access token is then used to get the credentials for AWS.
func (c *Client) awsGetSSOTokenHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var ssoConfig AWSSSOConfig
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&ssoConfig)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	sess, err := session.NewSession()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create new AWS session: %s", err.Error()))
		return
	}

	var accessToken string
	var accessTokenExpire int64
	if ssoConfig.AccessToken != "" {
		if ssoConfig.AccessTokenExpire < (time.Now().Unix()-60)*1000 {
			middleware.Errorf(w, r, nil, http.StatusBadRequest, "aws_sso_access_token_is_expired")
			return
		}

		accessToken = ssoConfig.AccessToken
		accessTokenExpire = ssoConfig.AccessTokenExpire
	} else {
		svcssooidc := ssooidc.New(sess, aws.NewConfig().WithRegion(ssoConfig.SSORegion))

		token, err := svcssooidc.CreateToken(&ssooidc.CreateTokenInput{
			ClientId:     ssoConfig.Client.ClientId,
			ClientSecret: ssoConfig.Client.ClientSecret,
			DeviceCode:   ssoConfig.Device.DeviceCode,
			GrantType:    stringPointer("urn:ietf:params:oauth:grant-type:device_code"),
		})
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create new AWS token: %s", err.Error()))
			return
		}

		accessToken = *token.AccessToken
		accessTokenExpire = (time.Now().Unix() + *token.ExpiresIn) * 1000
	}

	svcsso := sso.New(sess, aws.NewConfig().WithRegion(ssoConfig.SSORegion))

	creds, err := svcsso.GetRoleCredentials(&sso.GetRoleCredentialsInput{
		AccessToken: &accessToken,
		AccountId:   &ssoConfig.AccountID,
		RoleName:    &ssoConfig.RoleName,
	})
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not get AWS credentials: %s", err.Error()))
		return
	}

	middleware.Write(w, r, &AWSSSOCredentials{
		AccessKeyID:       *creds.RoleCredentials.AccessKeyId,
		SecretAccessKey:   *creds.RoleCredentials.SecretAccessKey,
		SessionToken:      *creds.RoleCredentials.SessionToken,
		Expire:            *creds.RoleCredentials.Expiration,
		Region:            ssoConfig.Region,
		SSORegion:         ssoConfig.SSORegion,
		StartURL:          ssoConfig.StartURL,
		AccountID:         ssoConfig.AccountID,
		RoleName:          ssoConfig.RoleName,
		AccessToken:       accessToken,
		AccessTokenExpire: accessTokenExpire,
		ClusterID:         ssoConfig.ClusterID,
	})
	return
}

func stringPointer(s string) *string {
	return &s
}
