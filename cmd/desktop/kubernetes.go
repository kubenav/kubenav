package main

import "C"

import (
	"encoding/json"
	"strings"

	"github.com/kubenav/kubenav/cmd/desktop/cerror"
	"github.com/kubenav/kubenav/cmd/desktop/dart_api_dl"
	"github.com/kubenav/kubenav/pkg/server"
	"github.com/kubenav/kubenav/pkg/shared"
)

// KubernetesClusters returns a list of all clusters which are know by the generated Kubernetes client.
//
//export KubernetesClusters
func KubernetesClusters() *C.char {
	activeCluster, clusters := kubeClient.GetClusters()

	data := struct {
		ActiveCluster string            `json:"activeCluster"`
		Clusters      map[string]string `json:"clusters"`
	}{
		ActiveCluster: activeCluster,
		Clusters:      clusters,
	}

	jsonData, err := json.Marshal(data)
	if err != nil {
		return C.CString(cerror.New(err))
	}

	return C.CString(string(jsonData))
}

// KubernetesRequest is used to execute a request against a Kubernetes API. The Kubernetes API server and it's ca are
// specified via the "clusterServer" and "clusterCertificateAuthorityData" arguments. To skip the tls verification the
// request can set the "clusterInsecureSkipTLSVerify" argument to true. To handle the authentication against the API
// server the "user*" arguments can be used.
// The "requestMethod", "requestURL" and "requestBody" arguments are then used for the actually request. E.g. to get all
// Pods from the Kubernetes API the method "GET" and the URL "/api/v1/pods" can be used.
//
//export KubernetesRequest
func KubernetesRequest(port C.long, contextNameC *C.char, contextNameLen C.int, requestMethodC *C.char, requestMethodLen C.int, requestURLC *C.char, requestURLLen C.int, requestBodyC *C.char, requestBodyLen C.int) {
	contextName := C.GoStringN(contextNameC, contextNameLen)
	requestMethod := C.GoStringN(requestMethodC, requestMethodLen)
	requestURL := C.GoStringN(requestURLC, requestURLLen)
	requestBody := C.GoStringN(requestBodyC, requestBodyLen)

	go kubernetesRequest(int64(port), contextName, requestMethod, requestURL, requestBody)
}

func kubernetesRequest(port int64, contextName, requestMethod, requestURL, requestBody string) {
	restConfig, clientset, err := kubeClient.GetClient(contextName, "", "", false, "", "", "", "", "")
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	requestURL = strings.TrimRight(restConfig.ServerName, "/") + requestURL

	result, err := shared.KubernetesRequest(clientset, requestMethod, requestURL, requestBody)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, result)
}

// KubernetesGetLogs returns the logs for a list of pods. The names of the Pods are provided via the "names" parameter,
// which must be a comma separated list of the Pod names. To use this function a user must also provide the namespace,
// container, since and previous parameter.
//
//export KubernetesGetLogs
func KubernetesGetLogs(port C.long, contextNameC *C.char, contextNameLen C.int, namesC *C.char, namesLen C.int, namespaceC *C.char, namespaceLen C.int, containerC *C.char, containerLen C.int, sinceC C.int, filterC *C.char, filterLen C.int, previousC C.int) {
	contextName := C.GoStringN(contextNameC, contextNameLen)
	names := C.GoStringN(namesC, namesLen)
	namespace := C.GoStringN(namespaceC, namespaceLen)
	container := C.GoStringN(containerC, containerLen)
	since := int64(sinceC)
	filter := C.GoStringN(filterC, filterLen)
	var previous bool
	if previousC == 1 {
		previous = true
	}

	go kubernetesGetLogs(int64(port), contextName, names, namespace, container, since, filter, previous)
}

func kubernetesGetLogs(port int64, contextName, names, namespace, container string, since int64, filter string, previous bool) {
	restConfig, clientset, err := kubeClient.GetClient(contextName, "", "", false, "", "", "", "", "")
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	result, err := shared.KubernetesGetLogs(clientset, strings.TrimRight(restConfig.ServerName, "/"), names, namespace, container, since, filter, previous)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, result)
}

// KubernetesStartServer starts an Go server which listens on "14122". The server is responsible for providing the
// port forwarding and Pod exec feature for kubenav.
//
//export KubernetesStartServer
func KubernetesStartServer() {
	go server.Start(kubeClient)
}
