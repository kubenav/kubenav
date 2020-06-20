package kube

import (
	"errors"
	"time"

	"github.com/sirupsen/logrus"
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
	config clientcmd.ClientConfig
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

// NewClient returns a new API client for a Kubernetes cluster.
func NewClient(incluster bool, kubeconfig, kubeconfigInclude, kubeconfigExclude string) (*Client, error) {
	var config clientcmd.ClientConfig
	var err error

	if incluster {
		config, err = loadInClusterConfig()
		if err != nil {
			return nil, err
		}
	} else if kubeconfigInclude != "" {
		config, err = loadConfigFiles(kubeconfigInclude, kubeconfigExclude)
		if err != nil {
			return nil, err
		}
	} else {
		config, err = loadConfigFile(kubeconfig)
		if err != nil {
			return nil, err
		}
	}

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

	logrus.Infof("%#v\n", raw)

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
// Note: We are using the same logic as kubectl, see https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/kubectl/pkg/cmd/config/use_context.go
func (c *Client) ChangeContext(context string) error {
	config, err := c.config.ConfigAccess().GetStartingConfig()
	if err != nil {
		return err
	}

	config.CurrentContext = context

	return clientcmd.ModifyConfig(c.config.ConfigAccess(), *config, true)
}

// ChangeNamespace is used to modify the namespace of the currently selected context and to persist these changes in the
// Kubeconfig file.
// In the frontend it is possible to select "" as namespace, which is used for the all namespaces selection. This isn't
// a valid value for the Kubeconfig file. Therefor we don't write these value back to the Kubeconfig file.
func (c *Client) ChangeNamespace(context, namespace string) error {
	if namespace == "" {
		return nil
	}

	config, err := c.config.ConfigAccess().GetStartingConfig()
	if err != nil {
		return err
	}

	config.Contexts[context].Namespace = namespace

	return clientcmd.ModifyConfig(c.config.ConfigAccess(), *config, true)
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
