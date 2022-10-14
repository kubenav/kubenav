package desktop

import (
	"fmt"
	"net/http"
	"net/url"
	"os"
	"os/user"
	"path"
	"time"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

// Platform is the name of the platform for which this client should be used.
const Platform = "dektop"

// Client is the structure of the desktop client.
type Client struct {
	config clientcmd.ClientConfig
}

// GetPlatform returns the name of the platform for which the client should be used.
func (c *Client) GetPlatform() string {
	return Platform
}

// GetClusters returns a list of all clusters, which are known by our Kubernetes client.
func (c *Client) GetClusters() (string, map[string]string) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return "", nil
	}

	var clusters map[string]string
	clusters = make(map[string]string)

	for contextName, contextDetails := range raw.Contexts {
		clusters[contextName] = contextDetails.Namespace
	}

	return raw.CurrentContext, clusters
}

// GetClient returns a rest client and clientset to interact with the specified Kubernetes API.
func (c *Client) GetClient(contextName, clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64) (*rest.Config, *kubernetes.Clientset, error) {
	raw, err := c.config.RawConfig()
	if err != nil {
		return nil, nil, err
	}

	override := &clientcmd.ConfigOverrides{CurrentContext: contextName}
	currentContextConfig := clientcmd.NewNonInteractiveClientConfig(raw, override.CurrentContext, override, &clientcmd.ClientConfigLoadingRules{})

	restClient, err := currentContextConfig.ClientConfig()
	if err != nil {
		return nil, nil, err
	}

	if timeout > 0 {
		restClient.Timeout = time.Duration(timeout) * time.Second
	}

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

// NewClient returns a new Kuberntes client for the dektop version of kubenav.
func NewClient() *Client {
	loadingRules := clientcmd.NewDefaultClientConfigLoadingRules()
	if _, ok := os.LookupEnv("HOME"); !ok {
		u, err := user.Current()
		if err != nil {
			fmt.Printf("could not get current user: %#v", err)
			return nil
		}

		loadingRules.Precedence = append(loadingRules.Precedence, path.Join(u.HomeDir, clientcmd.RecommendedHomeDir, clientcmd.RecommendedFileName))
	}

	return &Client{
		config: clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
			loadingRules,
			&clientcmd.ConfigOverrides{},
		),
	}
}
