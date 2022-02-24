package kube

import (
	"fmt"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

// GetClient returns a rest client and clientset to interact with the specified Kubernetes API.
func GetClient(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword string) (*rest.Config, *kubernetes.Clientset, error) {
	config, err := clientcmd.NewClientConfigFromBytes([]byte(`apiVersion: v1
clusters:
  - cluster:
      certificate-authority-data: ` + clusterCertificateAuthorityData + `
      insecure-skip-tls-verify: ` + fmt.Sprintf("%t", clusterInsecureSkipTLSVerify) + `
      server: ` + clusterServer + `
    name: kubenav
contexts:
  - context:
      cluster: kubenav
      user: kubenav
    name: kubenav
current-context: kubenav
kind: Config
users:
  - name: kubenav
    user:
      client-certificate-data: ` + userClientCertificateData + `
      client-key-data: ` + userClientKeyData + `
      password: ` + userPassword + `
      token: ` + userToken + `
      username: ` + userUsername))

	if err != nil {
		return nil, nil, err
	}

	restClient, err := config.ClientConfig()
	if err != nil {
		return nil, nil, err
	}

	clientset, err := kubernetes.NewForConfig(restClient)
	if err != nil {
		return nil, nil, err
	}

	return restClient, clientset, nil
}
