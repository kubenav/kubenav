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

type AWSRequest struct {
	AccessKeyId     string `json:"accessKeyId"`
	SecretAccessKey string `json:"secretAccessKey"`
	Region          string `json:"region"`
	ClusterID       string `json:"clusterID"`
}

type AWSTokenResponse struct {
	Token string `json:"token"`
}

// awsGetClustersHandler returns all EKS clusters from AWS.
func awsGetClustersHandler(w http.ResponseWriter, r *http.Request) {
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
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	var clusters []*eks.Cluster
	var names []*string
	var nextToken *string

	cred := credentials.NewStaticCredentials(awsRequest.AccessKeyId, awsRequest.SecretAccessKey, "")

	sess, err := session.NewSession(&aws.Config{Region: aws.String(awsRequest.Region), Credentials: cred})
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create new AWS session")
		return
	}

	eksClient := eks.New(sess)

	for {
		c, err := eksClient.ListClusters(&eks.ListClustersInput{NextToken: nextToken})
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not list EKS clusters")
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
			middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not cluster details")
			return
		}

		if *cluster.Cluster.Status == eks.ClusterStatusActive {
			clusters = append(clusters, cluster.Cluster)
		}
	}

	middleware.Write(w, r, clusters)
	return
}

// awsGetTokenHandler returns a bearer token for Kubernetes API requests.
// See: https://github.com/kubernetes-sigs/aws-iam-authenticator/blob/7547c74e660f8d34d9980f2c69aa008eed1f48d0/pkg/token/token.go#L310
func awsGetTokenHandler(w http.ResponseWriter, r *http.Request) {
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
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	cred := credentials.NewStaticCredentials(awsRequest.AccessKeyId, awsRequest.SecretAccessKey, "")

	sess, err := session.NewSession(&aws.Config{Region: aws.String(awsRequest.Region), Credentials: cred})
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create new AWS session")
		return
	}

	stsClient := sts.New(sess)

	request, _ := stsClient.GetCallerIdentityRequest(&sts.GetCallerIdentityInput{})
	request.HTTPRequest.Header.Add("x-k8s-aws-id", awsRequest.ClusterID)
	presignedURLString, err := request.Presign(60)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create presigned URL")
		return
	}

	awsTokenResponse := AWSTokenResponse{
		Token: fmt.Sprintf("k8s-aws-v1.%s", base64.RawURLEncoding.EncodeToString([]byte(presignedURLString))),
	}

	middleware.Write(w, r, awsTokenResponse)
	return
}
