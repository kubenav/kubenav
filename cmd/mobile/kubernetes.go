package kubenav

import (
	"strings"

	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/kube/mobile"
	"github.com/kubenav/kubenav/pkg/server"
	"github.com/kubenav/kubenav/pkg/shared"
)

// KubernetesRequest is used to execute a request against a Kubernetes API. The Kubernetes API server and it's ca are
// specified via the "clusterServer" and "clusterCertificateAuthorityData" arguments. To skip the tls verification the
// request can set the "clusterInsecureSkipTLSVerify" argument to true. To handle the authentication against the API
// server the "user*" arguments can be used.
// The "requestMethod", "requestURL" and "requestBody" arguments are then used for the actually request. E.g. to get all
// Pods from the Kubernetes API the method "GET" and the URL "/api/v1/pods" can be used.
func KubernetesRequest(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, requestMethod, requestURL, requestBody string) (string, error) {
	_, clientset, err := kube.NewClient(mobile.Platform).GetClient("", clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	requestURL = strings.TrimRight(clusterServer, "/") + requestURL

	return shared.KubernetesRequest(clientset, requestMethod, requestURL, requestBody)
}

// KubernetesGetLogs returns the logs for a list of pods. The names of the Pods are provided via the "names" parameter,
// which must be a comma separated list of the Pod names. To use this function a user must also provide the namespace,
// container, since and previous parameter.
func KubernetesGetLogs(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, names, namespace, container string, since int64, filter string, previous bool) (string, error) {
	_, clientset, err := kube.NewClient(mobile.Platform).GetClient("", clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	return shared.KubernetesGetLogs(clientset, strings.TrimRight(clusterServer, "/"), names, namespace, container, since, filter, previous)
}

// KubernetesStartServer starts an Go server which listens on "14122". The server is responsible for providing the
// port forwarding and Pod exec feature for kubenav.
func KubernetesStartServer() {
	kubeClient := kube.NewClient(mobile.Platform)
	server.Start(kubeClient)
}
