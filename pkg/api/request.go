package api

import (
	"fmt"
	"time"

	"k8s.io/apimachinery/pkg/types"
	"k8s.io/client-go/kubernetes"
)

// Request is the structure if the request data for an Kubernetes API server request. The data is needed for the
// authentication against the API server and the real request against the Kubernetes API.
type Request struct {
	Cluster                  string `json:"cluster"`
	Method                   string `json:"method"`
	URL                      string `json:"url"`
	Body                     string `json:"body"`
	CertificateAuthorityData string `json:"certificateAuthorityData"`
	ClientCertificateData    string `json:"clientCertificateData"`
	ClientKeyData            string `json:"clientKeyData"`
	Token                    string `json:"token"`
	Username                 string `json:"username"`
	Password                 string `json:"password"`
	InsecureSkipTLSVerify    bool   `json:"insecureSkipTLSVerify"`
	Timeout                  int64  `json:"timeout"`
}

// Response is the structure, which is used to return the data from an API request against the Kubernetes API server to
// the kubenav client.
type Response struct {
	Data string `json:"data"`
}

// KubernetesRequest makes the request to the Kubernetes API server. A request contains a method, url, body and timeout.
// The API server data is defined in the clientset.
func KubernetesRequest(method, url, body string, timeout int64, clientset *kubernetes.Clientset) ([]byte, error) {
	if method == "GET" {
		return clientset.RESTClient().Get().RequestURI(url).Timeout(time.Duration(timeout) * time.Second).DoRaw()
	} else if method == "DELETE" {
		return clientset.RESTClient().Delete().RequestURI(url).Timeout(time.Duration(timeout) * time.Second).DoRaw()
	} else if method == "PATCH" {
		return clientset.RESTClient().Patch(types.JSONPatchType).RequestURI(url).Body([]byte(body)).Timeout(time.Duration(timeout) * time.Second).DoRaw()
	}

	return []byte(``), fmt.Errorf("Request method is not implemented")
}
