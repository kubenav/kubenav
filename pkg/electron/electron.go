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

	router.HandleFunc("/api/cluster", middleware.Cors(clusterHandler))
	router.HandleFunc("/api/clusters", middleware.Cors(clustersHandler))

	router.HandleFunc("/api/sync/context", middleware.Cors(syncContextHandler))
	router.HandleFunc("/api/sync/namespace", middleware.Cors(syncNamespaceHandler))

	router.HandleFunc("/api/kubernetes/request", middleware.Cors(requestHandler))
	router.HandleFunc("/api/kubernetes/exec", middleware.Cors(execHandler))
	router.Handle("/api/kubernetes/sockjs/", api.CreateAttachHandler("/api/kubernetes/sockjs"))
	router.HandleFunc("/api/kubernetes/logs", middleware.Cors(logsHandler))
	router.HandleFunc("/api/kubernetes/logs/", middleware.Cors(api.StreamLogsHandler))
}
