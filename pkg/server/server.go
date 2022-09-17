package server

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/server/middleware"
)

type server struct {
	kubeClient kube.Client
}

// Start creates all routes for our internal http server and starts the server on port "14122".
func Start(kubeClient kube.Client) {
	s := &server{
		kubeClient: kubeClient,
	}

	router := http.NewServeMux()
	router.HandleFunc("/health", middleware.Cors(s.healthHandler))
	router.HandleFunc("/portforwarding", middleware.Cors(s.portForwardingHandler))
	router.HandleFunc("/terminal", middleware.Cors(s.terminalHandler))

	if err := http.ListenAndServe(":14122", router); err != nil {
		return
	}
}
