package electron

import (
	"fmt"
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/electron/kube"
)

// clusterHandler returns the cluster from the current context from the loaded kubeconfig.
func clusterHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	cluster, err := client.Cluster()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not load current cluster: %s", err.Error()))
		return
	}

	data := struct {
		Cluster string `json:"cluster"`
	}{
		cluster,
	}

	middleware.Write(w, r, data)
	return
}

// clustersHandler returns all clusters from the loaded kubeconfig.
func clustersHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	clusters, err := client.Clusters()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not load clusters %s", err.Error()))
		return
	}

	data := struct {
		Clusters map[string]kube.Cluster `json:"clusters"`
	}{
		clusters,
	}

	middleware.Write(w, r, data)
	return
}
