package kubenav

import (
	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/kube/mobile"
	"github.com/kubenav/kubenav/pkg/shared"
)

// PrometheusGetData returns metrics for a list of PromQL queries.
func PrometheusGetData(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, request string) (string, error) {
	restConfig, clientset, err := kube.NewClient(mobile.Platform).GetClient("", clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	return shared.PrometheusGetData(restConfig, clientset, request)
}
