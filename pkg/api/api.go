package api

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/handlers/terminal"
	"github.com/kubenav/kubenav/pkg/kube"
)

// Client implements the structure of our API client.
type Client struct {
	syncKubeconfig bool
	kubeClient     kube.Client
}

// Register takes an exting router an adds the routes for our API.
func (c *Client) Register(router *http.ServeMux) {
	// The health handler is used to check if the server is still running.
	// If the health check failes on mobile, the server is restarted.
	// For the server implementation of kubenav this API endpoint can be used for the liveness and readiness probe.
	router.HandleFunc("/api/health", middleware.Cors(c.healthHandler))

	// The AWS handlers are used to handle the authentication against AWS for the mobile implementation of kubenav.
	router.HandleFunc("/api/aws/clusters", middleware.Cors(c.awsGetClustersHandler))
	router.HandleFunc("/api/aws/token", middleware.Cors(c.awsGetTokenHandler))

	// The Azure handler is used to retrieve all AKS clusters from Azure for the mobile implementation of kubenav.
	router.HandleFunc("/api/azure/clusters", middleware.Cors(c.azureGetClustersHandler))

	// The clusters handler returns the current cluster and all clusters from a loaded Kubeconfig file for the server
	// and desktop implementation of kubenav.
	router.HandleFunc("/api/cluster", middleware.Cors(c.clusterHandler))
	router.HandleFunc("/api/clusters", middleware.Cors(c.clustersHandler))

	// The Kubernetes handlers are used for requests against the Kubernetes API. In addition to the normal requests we
	// are also handling exec requests into a pod, the streaming of log files, SSH connections to nodes, port forwarding
	// and the plugin logic, which is also implemented via port forwarding.
	router.HandleFunc("/api/kubernetes/request", middleware.Cors(c.kubernetesRequestHandler))
	router.HandleFunc("/api/kubernetes/exec", middleware.Cors(c.kubernetesExecHandler))
	router.Handle("/api/kubernetes/exec/sockjs/", terminal.CreateAttachHandler("/api/kubernetes/exec/sockjs"))
	router.HandleFunc("/api/kubernetes/logs", middleware.Cors(c.kubernetesLogsHandler))
	router.HandleFunc("/api/kubernetes/logs/", middleware.Cors(terminal.StreamLogsHandler))
	router.HandleFunc("/api/kubernetes/ssh", middleware.Cors(c.kubernetesSSHHandler))
	router.Handle("/api/kubernetes/ssh/sockjs/", terminal.CreateSSHHandler("/api/kubernetes/ssh/sockjs"))
	router.HandleFunc("/api/kubernetes/portforwarding", middleware.Cors(c.kubernetesPortForwardingHandler))
	router.HandleFunc("/api/kubernetes/plugins", middleware.Cors(c.kubernetesPluginHandler))

	// The OIDC handlers are used for the authentication against a Kubernetes cluster using OIDC. This is only used by
	// the mobile implementation of kubenav.
	router.HandleFunc("/api/oidc/link", middleware.Cors(c.oidcGetLinkHandler))
	router.HandleFunc("/api/oidc/refreshtoken", middleware.Cors(c.oidcGetRefreshTokenHandler))
	router.HandleFunc("/api/oidc/accesstoken", middleware.Cors(c.oidcGetAccessTokenHandler))

	// The sync handlers are used to write changes against the active cluster/context and the selected namespace back to
	// the loaded Kubeconfig file. This is only used by the desktop implementation of kubenav and must be enabled via
	// the "kubeconfig.sync" flag.
	router.HandleFunc("/api/sync/context", middleware.Cors(c.syncContextHandler))
	router.HandleFunc("/api/sync/namespace", middleware.Cors(c.syncNamespaceHandler))
}

// NewClient returns an new API client which then can be used to register all API routes to an existing router.
func NewClient(syncKubeconfig bool, kubeClient kube.Client) *Client {
	return &Client{
		syncKubeconfig: syncKubeconfig,
		kubeClient:     kubeClient,
	}
}
