// Package kube handles the initialization of a new Kubernetes client, which is used to interact with the Kubernetes
// API.
// The Client interface must be implemented by the mobile and the server package.
package kube

import (
	"time"

	"github.com/kubenav/kubenav/pkg/kube/mobile"
	"github.com/kubenav/kubenav/pkg/kube/server"
	"github.com/kubenav/kubenav/pkg/kube/types"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

// Client implements the structure of an Kubernetes API client.
// The server, desktop and mobile implementation share the same structure for the Kubernetes API client, also when not
// all methods (arguments) are really needed.
type Client interface {
	GetConfigAndClientset(cluster, server, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password string, insecureSkipTLSVerify bool, timeout time.Duration, proxy string) (*rest.Config, *kubernetes.Clientset, error)
	Cluster() (string, error)
	Clusters() (map[string]types.Cluster, error)
	ChangeContext(context string) error
	ChangeNamespace(context, namespace string) error
}

// NewClient returns a new Kubernetes API client.
// The mobile version of kubenav needs no additional parameters, but for the server and desktop version we provide more
// configuration options which are set via command-line arguments and therefor we have to pass them to the client.
func NewClient(isMobile bool, incluster bool, kubeconfig string, kubeconfigInclude string, kubeconfigExclude string) (Client, error) {
	if isMobile {
		return mobile.NewClient()
	}

	return server.NewClient(incluster, kubeconfig, kubeconfigInclude, kubeconfigExclude)
}
