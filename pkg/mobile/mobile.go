package mobile

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/api/middleware"
)

// StartServer starts the server for the mobile implementation of kubenav.
func StartServer() {
	router := http.NewServeMux()

	router.HandleFunc("/api/aws/clusters", middleware.Cors(awsGetClustersHandler))
	router.HandleFunc("/api/aws/token", middleware.Cors(awsGetTokenHandler))

	router.HandleFunc("/api/azure/clusters", middleware.Cors(azureGetClustersHandler))

	router.HandleFunc("/api/kubernetes/request", middleware.Cors(requestHandler))
	router.HandleFunc("/api/kubernetes/exec", middleware.Cors(execHandler))
	router.Handle("/api/kubernetes/sockjs/", api.CreateAttachHandler("/api/kubernetes/sockjs"))

	router.HandleFunc("/api/oidc/link", middleware.Cors(oidcGetLinkHandler))
	router.HandleFunc("/api/oidc/refreshtoken", middleware.Cors(oidcGetRefreshTokenHandler))
	router.HandleFunc("/api/oidc/accesstoken", middleware.Cors(oidcGetAccessTokenHandler))

	if err := http.ListenAndServe(":14122", router); err != nil {
		return
	}
}
