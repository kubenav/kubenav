// Package server implements the Kubernetes API client interface for the server and desktop version of kubenav.
package server

import (
	"net/http"
	"net/url"
	"time"

	"github.com/kubenav/kubenav/pkg/kube/types"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

// Client implements an API client for the Kubernetes API.
type Client struct {
	config clientcmd.ClientConfig
}

// NewClient returns a new API client for Kubernetes.
// When the incluster option is true, we are using the in cluster configuration for the client, when a slice of
// Kubeconfig files is provided which should be included/excluded we are loading these files. By default we are using
// the standard way to load the cluster configuration.
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
func (c *Client) Clusters() (map[string]types.Cluster, error) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return nil, err
	}

	var clusters map[string]types.Cluster
	clusters = make(map[string]types.Cluster)

	for context, details := range raw.Contexts {
		if cluster, ok := raw.Clusters[details.Cluster]; ok && cluster.Server != "" {
			clusters[context] = types.Cluster{
				ID:        context,
				Name:      context,
				URL:       cluster.Server,
				Namespace: details.Namespace,
			}
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

// GetConfigAndClientset returns an rest client and the clientset to interact with a Kubernetes cluster.
// The server and desktop implementation mainly uses the "cluster" argument, because only need to select the current
// cluster (for kubenav this is the same like the context) to interact with.
func (c *Client) GetConfigAndClientset(cluster, server, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password string, insecureSkipTLSVerify bool, timeout time.Duration, proxy string) (*rest.Config, *kubernetes.Clientset, error) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return nil, nil, err
	}

	override := &clientcmd.ConfigOverrides{CurrentContext: cluster}
	currentContextConfig := clientcmd.NewNonInteractiveClientConfig(raw, override.CurrentContext, override, &clientcmd.ClientConfigLoadingRules{})

	restClient, err := currentContextConfig.ClientConfig()
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
