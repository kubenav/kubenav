package kubenav

import (
	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/kube/mobile"
	"github.com/kubenav/kubenav/pkg/shared"
)

// HelmListCharts returns a list of Helm charts for the given cluster and namespace. If an error occures during the
// process the error is returned.
func HelmListCharts(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, namespace string) (string, error) {
	_, clientset, err := kube.NewClient(mobile.Platform).GetClient("", clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	return shared.HelmListCharts(clientset, namespace)
}

// HelmGetChart returns a single of Helm chart. The Helm chart is identified by it's namespace, name and version. If an
// error occures during the process the error is returned.
func HelmGetChart(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, namespace, name string, version int64) (string, error) {
	_, clientset, err := kube.NewClient(mobile.Platform).GetClient("", clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	return shared.HelmGetChart(clientset, namespace, name, version)
}

// HelmGetHistory returns the History of a Helm chart. The Helm chart is identified by it's namespace and name. If an
// error occures during the process the error is returned.
func HelmGetHistory(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, namespace, name string) (string, error) {
	_, clientset, err := kube.NewClient(mobile.Platform).GetClient("", clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	return shared.HelmGetHistory(clientset, namespace, name)
}
