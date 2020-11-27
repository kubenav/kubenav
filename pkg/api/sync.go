package api

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"

	log "github.com/sirupsen/logrus"
)

// Sync is the structure for a sync request and contains the context or namespace as values.
type Sync struct {
	Context   string `json:"context"`
	Namespace string `json:"namespace"`
}

// syncContextHandler applies the changes of the current cluster/context to the loaded Kubeconfig file. The used
// kubeClient.ChangeContext() function to get the current cluster/context only works for the server and desktop
// implementation of kubenav. When this function is called on mobile an error is returned.
func (c *Client) syncContextHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
	}

	if !c.syncKubeconfig {
		middleware.Write(w, r, nil)
		return
	}

	var sync Sync
	if r.Body == nil {
		log.Errorf("Sync body is empty")
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Sync body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&sync)
	if err != nil {
		log.WithError(err).Error("Could not decode sync body")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode sync body: %s", err.Error()))
		return
	}

	err = c.kubeClient.ChangeContext(sync.Context)
	if err != nil {
		log.WithError(err).Error("Could not change context")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not change context: %s", err.Error()))
		return
	}

	middleware.Write(w, r, nil)
	return
}

// syncContextHandler applies the changes of the current namespace to the loaded Kubeconfig. The used
// kubeClient.ChangeNamespace() function to get the current cluster/context only works for the server and desktop
// implementation of kubenav. When this function is called on mobile an error is returned
func (c *Client) syncNamespaceHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
	}

	if !c.syncKubeconfig {
		middleware.Write(w, r, nil)
		return
	}

	var sync Sync
	if r.Body == nil {
		log.Errorf("Sync body is empty")
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Sync body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&sync)
	if err != nil {
		log.WithError(err).Error("Could not decode sync body")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode sync body: %s", err.Error()))
		return
	}

	err = c.kubeClient.ChangeNamespace(sync.Context, sync.Namespace)
	if err != nil {
		log.WithError(err).Error("Could not change context")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not change context: %s", err.Error()))
		return
	}

	middleware.Write(w, r, nil)
	return
}
