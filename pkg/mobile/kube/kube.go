package kube

import (
	"encoding/base64"
	"fmt"
	"net/http"
	"net/url"
	"time"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

// ConfigClientset can be used to create an config and clientset for an Kubernetes API call from the fields from an
// API request.
func ConfigClientset(server, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password string, insecureSkipTLSVerify bool, timeout time.Duration, proxy string) (*rest.Config, *kubernetes.Clientset, error) {
	config, err := clientcmd.NewClientConfigFromBytes([]byte(`apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ` + base64.StdEncoding.EncodeToString([]byte(certificateAuthorityData)) + `
    insecure-skip-tls-verify: ` + fmt.Sprintf("%t", insecureSkipTLSVerify) + `
    server: ` + server + `
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
    client-certificate-data: ` + base64.StdEncoding.EncodeToString([]byte(clientCertificateData)) + `
    client-key-data: ` + base64.StdEncoding.EncodeToString([]byte(clientKeyData)) + `
    password: ` + password + `
    token: ` + token + `
    username: ` + username))

	if err != nil {
		return nil, nil, err
	}

	restClient, err := config.ClientConfig()
	if err != nil {
		return nil, nil, err
	}

	restClient.Timeout = timeout

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
