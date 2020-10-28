package api

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/eks"
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
