package kube

import (
	"fmt"
	"net/http"
	"net/url"
	"time"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

func NewClient(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64) (restClient *rest.Config, clientset *kubernetes.Clientset, err error) {
	defer func() {
		if r := recover(); r != nil {
			err = fmt.Errorf("panic: %#v", r)
		}
	}()

	return newClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
}

func newClient(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64) (*rest.Config, *kubernetes.Clientset, error) {
	// If a token is provided, we must ensure that the username and password are
	// empty. Otherwise the app would crash in such cases.
	if userToken != "" {
		userUsername = ""
		userPassword = ""
	}

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

	if timeout > 0 {
		restClient.Timeout = time.Duration(timeout) * time.Second
	}

	if proxy != "" {
		proxyURL, err := url.Parse(proxy)
		if err != nil {
			return nil, nil, err
		}

		restClient.Transport = &http.Transport{Proxy: http.ProxyURL(proxyURL)}
	}

	clientset, err := kubernetes.NewForConfig(restClient)
	if err != nil {
		return nil, nil, err
	}

	return restClient, clientset, nil
}
