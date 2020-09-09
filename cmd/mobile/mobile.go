package mobile

import (
	"net/http"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/kube"
)

// StartServer starts the server for the mobile implementation of kubenav.
// To register all needed API routes we have to create a new router and a Kubernetes API client. For the Kubernetes API
// client we only have to set the isMobile argument to true, all other arguments are not needed for the mobile
//implementation. Therefore we do not check for a returned error, because the initialization of the Kubernetes API
// client for mobile can not return an error. When the router and Kubernetes API client is created, we are creating a
// new API client and register all API routes. Finally we start the server which always listen on port 14122.
func StartServer() {
	router := http.NewServeMux()
	kubeClient, _ := kube.NewClient(true, false, "", "", "", "")
	apiClient := api.NewClient(false, kubeClient)
	apiClient.Register(router)

	if err := http.ListenAndServe(":14122", router); err != nil {
		return
	}
}
