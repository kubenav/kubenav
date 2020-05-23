package kube

import (
	"errors"
	"os"
	"path/filepath"
	"time"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

var (
	// ErrConfigNotFound is thrown if there is not a confgiuration file for Kubernetes.
	ErrConfigNotFound = errors.New("config not found")
)

// Client implements an API client for a Kubernetes cluster.
type Client struct {
	config     clientcmd.ClientConfig
	kubeconfig string
}

// Cluster implements the cluster type used in the React app.
type Cluster struct {
	ID                       string `json:"id"`
	Name                     string `json:"name"`
	URL                      string `json:"url"`
	CertificateAuthorityData string `json:"certificateAuthorityData"`
	ClientCertificateData    string `json:"clientCertificateData"`
	ClientKeyData            string `json:"clientKeyData"`
	Token                    string `json:"token"`
	Username                 string `json:"username"`
	Password                 string `json:"password"`
	AuthProvider             string `json:"authProvider"`
	Namespace                string `json:"namespace"`
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
		config:     config,
		kubeconfig: kubeconfig,
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
			URL:       cluster.Server,
			Namespace: details.Namespace,
		}
	}

	return clusters, nil
}

// ChangeContext is used to modify the current-context value in the used Kubeconfig file and to persist these changes.
// Note: We modify the raw config directly and do not use the logic of the ConfigClientset function, because the
// override has no effect to the raw config. See: https://github.com/kubernetes/client-go/issues/735
func (c *Client) ChangeContext(context string) error {
	raw, err := c.config.RawConfig()
	if err != nil {
		return err
	}

	raw.CurrentContext = context

	return clientcmd.WriteToFile(raw, c.kubeconfig)
}

// ChangeNamespace is used to modify the namespace of the currently selected context and to persist these changes in the
// Kubeconfig file.
// In the frontend it is possible to select "" as namespace, which is used for the all namespaces selection. This isn't
// a valid value for the Kubeconfig file. Therefor we don't write these value back to the Kubeconfig file.
func (c *Client) ChangeNamespace(context, namespace string) error {
	if namespace == "" {
		return nil
	}

	raw, err := c.config.RawConfig()
	if err != nil {
		return err
	}

	raw.Contexts[context].Namespace = namespace

	return clientcmd.WriteToFile(raw, c.kubeconfig)
}

// ConfigClientset creates the config and clientset for an Kubernetes API call.
func (c *Client) ConfigClientset(context string, timeout time.Duration) (*rest.Config, *kubernetes.Clientset, error) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return nil, nil, err
	}

	override := &clientcmd.ConfigOverrides{CurrentContext: context}
	currentContextConfig := clientcmd.NewNonInteractiveClientConfig(raw, override.CurrentContext, override, &clientcmd.ClientConfigLoadingRules{})

	restClient, err := currentContextConfig.ClientConfig()
	if err != nil {
		return nil, nil, err
	}

	restClient.Timeout = timeout

	clientset, err := kubernetes.NewForConfig(restClient)
	if err != nil {
		return nil, nil, err
	}

	return restClient, clientset, nil
}
