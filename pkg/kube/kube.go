package kube

import (
	"errors"
	"k8s.io/client-go/kubernetes"
	"os"
	"path/filepath"

	"github.com/kubenav/kubenav/pkg/api"

	"k8s.io/client-go/tools/clientcmd"
)

var (
	// ErrConfigNotFound is thrown if there is not a confgiuration file for Kubernetes.
	ErrConfigNotFound = errors.New("config not found")
)

// Client implements an API client for a Kubernetes cluster.
type Client struct {
	config clientcmd.ClientConfig
}

// Cluster implements the cluster type used in the React app.
type Cluster struct {
	ID                       string `json:"id"`
	Name                     string `json:"name"`
	Url                      string `json:"url"`
	CertificateAuthorityData string `json:"certificateAuthorityData"`
	ClientCertificateData    string `json:"clientCertificateData"`
	ClientKeyData            string `json:"clientKeyData"`
	Token                    string `json:"token"`
	Username                 string `json:"username"`
	Password                 string `json:"password"`
	AuthProvider             string `json:"authProvider"`
	Namespace                string `json:"namespace"`
}

// JSONPatch is the json patch formate to update the machine deployment
type JSONPatch struct {
	Op    string `json:"op"`
	Path  string `json:"path"`
	Value int32  `json:"value"`
}

// homeDir returns the users home directory, where the '.kube' directory is located.
// The '.kube' directory contains the configuration file for a Kubernetes cluster.
func homeDir() string {
	if h := os.Getenv("HOME"); h != "" {
		return h
	}

	// Get the home directory on windows.
	return os.Getenv("USERPROFILE")
}

// NewClient returns a new API client for a Kubernetes cluster.
// If the cluster parameter is true the client is configured inside the cluster. If the cluster parameter is false the
// client is configures outside the cluster.
func NewClient(kubeconfig string) (*Client, error) {
	if kubeconfig == "" {
		if os.Getenv("KUBECONFIG") == "" {
			if home := homeDir(); home != "" {
				kubeconfig = filepath.Join(home, ".kube", "config")
			} else {
				return nil, ErrConfigNotFound
			}
		} else {
			kubeconfig = os.Getenv("KUBECONFIG")
		}
	}

	config := clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
		&clientcmd.ClientConfigLoadingRules{ExplicitPath: kubeconfig},
		&clientcmd.ConfigOverrides{},
	)

	return &Client{
		config: config,
	}, nil
}

// Cluster returns the current context from the loaded Kubeconfig.
func (c *Client) Cluster() (string, error) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return "", err
	}

	return raw.CurrentContext, nil
}

// Clusters returns all clusters from the loaded Kubeconfig file in the format for the React app.
func (c *Client) Clusters() (map[string]Cluster, error) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return nil, err
	}

	var clusters map[string]Cluster
	clusters = make(map[string]Cluster)

	for context, details := range raw.Contexts {
		cluster := raw.Clusters[details.Cluster]

		clusters[context] = Cluster{
			ID:        context,
			Name:      context,
			Url:       cluster.Server,
			Namespace: details.Namespace,
		}
	}

	return clusters, nil
}

// Request creates the clientset for an Kubernetes API call.
func (c *Client) Request(request api.APIRequest) (*kubernetes.Clientset, error) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return nil, err
	}

	override := &clientcmd.ConfigOverrides{CurrentContext: request.Cluster}
	currentContextConfig := clientcmd.NewNonInteractiveClientConfig(raw, override.CurrentContext, override, &clientcmd.ClientConfigLoadingRules{})

	restClient, err := currentContextConfig.ClientConfig()
	if err != nil {
		return nil, err
	}

	return kubernetes.NewForConfig(restClient)
}
