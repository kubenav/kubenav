package electron

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/kube"
)

func clusterHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	cluster, err := client.Cluster()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not load current cluster")
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

func clustersHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	clusters, err := client.Clusters()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not load clusters")
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
