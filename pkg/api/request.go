package api

import (
	"context"
	"fmt"

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

// Error implements the structure of a response for a failed Kubernetes API request.
type Error struct {
	Kind       string `json:"kind"`
	APIVersion string `json:"apiVersion"`
	Status     string `json:"status"`
	Message    string `json:"message"`
	Reason     string `json:"reason"`
	Code       int    `json:"code"`
}

// KubernetesRequest makes the request to the Kubernetes API server. A request contains a method, url, body and timeout.
// The API server data is defined in the clientset.
func KubernetesRequest(ctx context.Context, method, url, body string, clientset *kubernetes.Clientset) ([]byte, error) {
	if method == "GET" {
		return clientset.RESTClient().Get().RequestURI(url).DoRaw(ctx)
	} else if method == "DELETE" {
		return clientset.RESTClient().Delete().RequestURI(url).DoRaw(ctx)
	} else if method == "PATCH" {
		return clientset.RESTClient().Patch(types.JSONPatchType).RequestURI(url).Body([]byte(body)).DoRaw(ctx)
	}

	return []byte(``), fmt.Errorf("Request method is not implemented")
}
