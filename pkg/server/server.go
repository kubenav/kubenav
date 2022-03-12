package server

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/server/middleware"
)

// Start creates all routes for our internal http server and starts the server on port "14122".
func Start() {
	router := http.NewServeMux()
	router.HandleFunc("/health", middleware.Cors(healthHandler))
	router.HandleFunc("/portforwarding", middleware.Cors(portForwardingHandler))

	if err := http.ListenAndServe(":14122", router); err != nil {
		return
	}
}
