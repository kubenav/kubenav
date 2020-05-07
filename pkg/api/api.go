package api

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"
)

func Register(router *http.ServeMux) {
	router.HandleFunc("/api/test", middleware.Cors(testHandler))
	router.HandleFunc("/api/aws/clusters", middleware.Cors(awsGetClustersHandler))
	router.HandleFunc("/api/aws/token", middleware.Cors(awsGetTokenHandler))
	router.HandleFunc("/api/azure/clusters", middleware.Cors(azureGetClustersHandler))
	router.HandleFunc("/api/kubernetes/request", middleware.Cors(requestHandler))
	router.HandleFunc("/api/oidc/link", middleware.Cors(oidcGetLinkHandler))
	router.HandleFunc("/api/oidc/refreshtoken", middleware.Cors(oidcGetRefreshTokenHandler))
	router.HandleFunc("/api/oidc/accesstoken", middleware.Cors(oidcGetAccessTokenHandler))
}

func testHandler(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Status string `json:"status"`
	}{
		"ok",
	}

	middleware.Write(w, r, data)
}
