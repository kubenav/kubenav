package electron

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/electron/kube"
)

var client *kube.Client
var syncKubeconfig bool

// Register registers the needed API routes for the Electron version of kubenav.
func Register(router *http.ServeMux, sync bool, kubeClient *kube.Client) {
	syncKubeconfig = sync
	client = kubeClient

	router.HandleFunc("/api/health", middleware.Cors(healthHandler))

	router.HandleFunc("/api/cluster", middleware.Cors(clusterHandler))
	router.HandleFunc("/api/clusters", middleware.Cors(clustersHandler))

	router.HandleFunc("/api/sync/context", middleware.Cors(syncContextHandler))
	router.HandleFunc("/api/sync/namespace", middleware.Cors(syncNamespaceHandler))

	router.HandleFunc("/api/kubernetes/request", middleware.Cors(requestHandler))
	router.HandleFunc("/api/kubernetes/exec", middleware.Cors(execHandler))
	router.Handle("/api/kubernetes/exec/sockjs/", api.CreateAttachHandler("/api/kubernetes/exec/sockjs"))
	router.HandleFunc("/api/kubernetes/logs", middleware.Cors(logsHandler))
	router.HandleFunc("/api/kubernetes/logs/", middleware.Cors(api.StreamLogsHandler))
	router.HandleFunc("/api/kubernetes/ssh", middleware.Cors(sshHandler))
	router.Handle("/api/kubernetes/ssh/sockjs/", api.CreateSSHHandler("/api/kubernetes/ssh/sockjs"))
	router.HandleFunc("/api/kubernetes/portforwarding", middleware.Cors(portForwardingHandler))
	router.HandleFunc("/api/kubernetes/plugins", middleware.Cors(pluginHandler))
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
}
