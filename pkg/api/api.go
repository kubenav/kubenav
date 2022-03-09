package api

import (
	"net/http"
)

// HealthHandler always returns a status ok response and can be used to check if the server is running or not.
func HealthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
}
