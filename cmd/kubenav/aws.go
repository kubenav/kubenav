package kubenav

import (
	"encoding/base64"
	"encoding/json"
	"fmt"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/eks"
	"github.com/aws/aws-sdk-go/service/sts"
)

// AWSGetClusters returns all clusters which can be accessed with the given credentials.
func AWSGetClusters(accessKeyID, secretKey, region, sessionToken string) (string, error) {
	var clusters []*eks.Cluster
	var names []*string
	var nextToken *string

	cred := credentials.NewStaticCredentials(accessKeyID, secretKey, sessionToken)

	sess, err := session.NewSession(&aws.Config{Region: aws.String(region), Credentials: cred})
	if err != nil {
		return "", err
	}

	eksClient := eks.New(sess)

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

// AWSGetToken returns a token, which can be used to access the Kubernetes API of a cluster with the given clusterID.
// See: https://github.com/kubernetes-sigs/aws-iam-authenticator/blob/7547c74e660f8d34d9980f2c69aa008eed1f48d0/pkg/token/token.go#L310
func AWSGetToken(accessKeyID, secretKey, region, sessionToken, clusterID string) (string, error) {
	cred := credentials.NewStaticCredentials(accessKeyID, secretKey, sessionToken)

	sess, err := session.NewSession(&aws.Config{Region: aws.String(region), Credentials: cred})
	if err != nil {
		return "", err
	}

	stsClient := sts.New(sess)

	request, _ := stsClient.GetCallerIdentityRequest(&sts.GetCallerIdentityInput{})
	request.HTTPRequest.Header.Add("x-k8s-aws-id", clusterID)
	presignedURLString, err := request.Presign(60)
	if err != nil {
		return "", err
	}

	return fmt.Sprintf("k8s-aws-v1.%s", base64.RawURLEncoding.EncodeToString([]byte(presignedURLString))), nil
}
