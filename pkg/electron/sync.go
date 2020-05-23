package electron

import (
	"encoding/json"
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"
)

// Sync is the structure for a sync request and contains the context or namespace as values.
type Sync struct {
	Context   string `json:"context"`
	Namespace string `json:"namespace"`
}

// syncContextHandler applies the changes of the current context to the loaded Kubeconfig.
func syncContextHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
	}

	if !syncKubeconfig {
		middleware.Write(w, r, nil)
		return
	}

	var sync Sync
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Sync body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&sync)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode sync body")
		return
	}

	err = client.ChangeContext(sync.Context)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not change context")
		return
	}

	middleware.Write(w, r, nil)
	return
}

// syncContextHandler applies the changes of the current namespace to the loaded Kubeconfig.
func syncNamespaceHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
	}

	if !syncKubeconfig {
		middleware.Write(w, r, nil)
		return
	}

	var sync Sync
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Sync body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&sync)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode sync body")
		return
	}

	err = client.ChangeNamespace(sync.Context, sync.Namespace)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not change namespace")
		return
	}

	middleware.Write(w, r, nil)
	return
}
