package server

import (
	"net/http"

	"github.com/kubenav/kubenav/cmd/kubenav/server/middleware"
)

// Start creates all routes for our internal http server and starts the server on port "14122".
func Start() {
	router := http.NewServeMux()
	router.HandleFunc("/health", middleware.Cors(healthHandler))
	router.HandleFunc("/portforwarding", middleware.Cors(portForwardingHandler))
	router.HandleFunc("/terminal", middleware.Cors(terminalHandler))
	router.HandleFunc("/logs", middleware.Cors(logsHandler))

	if err := http.ListenAndServe(":14122", router); err != nil {
		return
	}
}
