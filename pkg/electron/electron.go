package electron

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/kube"

	"k8s.io/apimachinery/pkg/types"
)

var client *kube.Client

func Register(router *http.ServeMux, kubeClient *kube.Client) {
	client = kubeClient

	router.HandleFunc("/api/cluster", middleware.Cors(clusterHandler))
	router.HandleFunc("/api/clusters", middleware.Cors(clustersHandler))
	router.HandleFunc("/api/kubernetes/request/electron", middleware.Cors(requestHandler))
}

func clusterHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	cluster, err := client.Cluster()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not load current cluster")
		return
	}

	data := struct {
		Cluster string `json:"cluster"`
	}{
		cluster,
	}

	middleware.Write(w, r, data)
	return
}

func clustersHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		middleware.Write(w, r, nil)
	}

	clusters, err := client.Clusters()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not load clusters")
		return
	}

	data := struct {
		Clusters map[string]kube.Cluster `json:"clusters"`
	}{
		clusters,
	}

	middleware.Write(w, r, data)
	return
}

func requestHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.APIRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	clientset, err := client.Request(request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create clientset")
		return
	}

	var result []byte

	if request.Method == "GET" {
		result, err = clientset.RESTClient().Get().RequestURI(request.URL).Timeout(time.Duration(request.Timeout) * time.Second).DoRaw()
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
			return
		}
	} else if request.Method == "DELETE" {
		result, err = clientset.RESTClient().Delete().RequestURI(request.URL).Timeout(time.Duration(request.Timeout) * time.Second).DoRaw()
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
			return
		}
	} else if request.Method == "PATCH" {
		result, err = clientset.RESTClient().Patch(types.JSONPatchType).RequestURI(request.URL).Body([]byte(request.Body)).Timeout(time.Duration(request.Timeout) * time.Second).DoRaw()
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
			return
		}
	} else {
		middleware.Errorf(w, r, nil, http.StatusNotImplemented, "Request method is not implemented")
		return
	}

	apiResponse := api.APIResponse{
		Data: strings.TrimSuffix(string(result), "\n"),
	}

	middleware.Write(w, r, apiResponse)
	return
}
