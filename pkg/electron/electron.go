package electron

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/kube"
)

var client *kube.Client

func Register(router *http.ServeMux, kubeClient *kube.Client) {
	client = kubeClient

	router.HandleFunc("/api/cluster", middleware.Cors(clusterHandler))
	router.HandleFunc("/api/clusters", middleware.Cors(clustersHandler))
	router.HandleFunc("/api/kubernetes/request/electron", middleware.Cors(requestHandler))
	router.HandleFunc("/api/kubernetes/exec/electron", middleware.Cors(execHandler))
}
