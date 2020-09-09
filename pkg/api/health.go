package api

import (
	"net/http"
)

// healthHandler always returns status ok. It is mainly used to check if the server died on mobile so that the server
// can be restarted. It can also be used for the liveness and readiness probe when kubenav is deployed in a Kubernetes
// cluster.
func (c *Client) healthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
}
