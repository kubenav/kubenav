// Package mobile implements the Kubernetes API client interface for the mobile version of kubenav.
package mobile

import (
	"encoding/base64"
	"fmt"
	"net/http"
	"net/url"
	"time"

	"github.com/kubenav/kubenav/pkg/kube/types"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

// Client implements an API client for the Kubernetes API.
// On mobile we do not realy uses this client, since all configration options are accessed via the frontend and they are
// sent with every request.
type Client struct{}

// NewClient returns a new API client for Kubernetes.
func NewClient() (*Client, error) {
	return &Client{}, nil
}

// Cluster is only used for the server and desktop version of kubenav and not implemented for the mobile version.
func (c *Client) Cluster() (string, error) {
	return "", fmt.Errorf("Not implemented")
}

// Clusters is only used for the server and desktop version of kubenav and not implemented for the mobile version.
func (c *Client) Clusters() (map[string]types.Cluster, error) {
	return nil, fmt.Errorf("Not implemented")
}

// ChangeContext is only used for the server and desktop version of kubenav and not implemented for the mobile version.
func (c *Client) ChangeContext(context string) error {
	return fmt.Errorf("Not implemented")
}

// ChangeNamespace is only used for the server and desktop version of kubenav and not implemented for the mobile version.
func (c *Client) ChangeNamespace(context, namespace string) error {
	return fmt.Errorf("Not implemented")
}

// GetConfigAndClientset returns an rest client and the clientset to interact with a Kubernetes cluster.
// The mobile implementation uses every argument, expect the "cluster", because we have to sent the cluster
// configuration with every API request.
func (c *Client) GetConfigAndClientset(cluster, server, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password string, insecureSkipTLSVerify bool, timeout time.Duration, proxy string) (*rest.Config, *kubernetes.Clientset, error) {
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
