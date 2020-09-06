package mobile

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/api/middleware"
)

// StartServer starts the server for the mobile implementation of kubenav.
func StartServer() {
	router := http.NewServeMux()

	router.HandleFunc("/api/health", middleware.Cors(healthHandler))

	router.HandleFunc("/api/aws/clusters", middleware.Cors(awsGetClustersHandler))
	router.HandleFunc("/api/aws/token", middleware.Cors(awsGetTokenHandler))

	router.HandleFunc("/api/azure/clusters", middleware.Cors(azureGetClustersHandler))

	router.HandleFunc("/api/kubernetes/request", middleware.Cors(requestHandler))
	router.HandleFunc("/api/kubernetes/exec", middleware.Cors(execHandler))
	router.Handle("/api/kubernetes/exec/sockjs/", api.CreateAttachHandler("/api/kubernetes/exec/sockjs"))
	router.HandleFunc("/api/kubernetes/logs", middleware.Cors(logsHandler))
	router.HandleFunc("/api/kubernetes/logs/", middleware.Cors(api.StreamLogsHandler))
	router.HandleFunc("/api/kubernetes/ssh", middleware.Cors(sshHandler))
	router.Handle("/api/kubernetes/ssh/sockjs/", api.CreateSSHHandler("/api/kubernetes/ssh/sockjs"))
	router.HandleFunc("/api/kubernetes/portforwarding", middleware.Cors(portForwardingHandler))
	router.HandleFunc("/api/kubernetes/plugins", middleware.Cors(pluginHandler))

	router.HandleFunc("/api/oidc/link", middleware.Cors(oidcGetLinkHandler))
	router.HandleFunc("/api/oidc/refreshtoken", middleware.Cors(oidcGetRefreshTokenHandler))
	router.HandleFunc("/api/oidc/accesstoken", middleware.Cors(oidcGetAccessTokenHandler))

	if err := http.ListenAndServe(":14122", router); err != nil {
		return
	}
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
}
