package api

import (
	"fmt"
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/kube/types"
)

// clusterHandler returns the current cluster/context from the loaded Kubeconfig file. The used kubeClient.Cluster()
// function to get the current cluster/context only works for the server and desktop implementation of kubenav. When
// this function is called on mobile an error is returned.
func (c *Client) clusterHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	cluster, err := c.kubeClient.Cluster()
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

// clustersHandler returns all clusters from the loaded Kubeconfig file. The used kubeClient.Clusters()
// function to get the current cluster/context only works for the server and desktop implementation of kubenav. When
// this function is called on mobile an error is returned.
func (c *Client) clustersHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	clusters, err := c.kubeClient.Clusters()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not load clusters %s", err.Error()))
		return
	}

	data := struct {
		Clusters map[string]types.Cluster `json:"clusters"`
	}{
		clusters,
	}

	middleware.Write(w, r, data)
	return
}
