package kubernetes

import (
	"encoding/base64"
	"fmt"
	"time"

	"k8s.io/apimachinery/pkg/types"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

// Client can be used to create an config and clientset for an Kubernetes API call from the fields from an
// API request.
func Client(server, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password string, insecureSkipTLSVerify bool) (*rest.Config, *kubernetes.Clientset, error) {
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

	clientset, err := kubernetes.NewForConfig(restClient)
	if err != nil {
		return nil, nil, err
	}

	return restClient, clientset, nil
}

func Request(method, url, body string, timeout int64, clientset *kubernetes.Clientset) ([]byte, error) {
	if method == "GET" {
		return clientset.RESTClient().Get().RequestURI(url).Timeout(time.Duration(timeout) * time.Second).DoRaw()
	} else if method == "DELETE" {
		return clientset.RESTClient().Delete().RequestURI(url).Timeout(time.Duration(timeout) * time.Second).DoRaw()
	} else if method == "PATCH" {
		return clientset.RESTClient().Patch(types.JSONPatchType).RequestURI(url).Body([]byte(body)).Timeout(time.Duration(timeout) * time.Second).DoRaw()
	}

	return []byte(``), fmt.Errorf("Request method is not implemented")
}
