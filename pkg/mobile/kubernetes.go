package mobile

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/mobile/kube"

	"k8s.io/client-go/tools/remotecommand"
)

// requestHandler handles the requests against the Kubernetes API server.
func requestHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.Request
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	_, clientset, err := kube.ConfigClientset(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create Kubernetes API client")
		return
	}

	result, err := api.KubernetesRequest(request.Method, request.URL, request.Body, clientset)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
		return
	}

	apiResponse := api.Response{
		Data: strings.TrimSuffix(string(result), "\n"),
	}

	middleware.Write(w, r, apiResponse)
	return
}

// execHandler handles the requests to get a shell into a container.
func execHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.Request
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	config, clientset, err := kube.ConfigClientset(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create Kubernetes API client")
		return
	}

	sessionID, err := api.GenTerminalSessionID()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not generate terminal session id")
		return
	}

	api.TerminalSessions.Set(sessionID, api.TerminalSession{
		ID:       sessionID,
		Bound:    make(chan error),
		SizeChan: make(chan remotecommand.TerminalSize),
	})

	shell := ""
	go api.WaitForTerminal(config, clientset, &request, shell, sessionID)

	middleware.Write(w, r, api.TerminalResponse{ID: sessionID})
	return
}

// logsHandler handles the requests to stream the logs of a container.
func logsHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.Request
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	_, clientset, err := kube.ConfigClientset(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, 6*time.Hour)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create clientset")
		return
	}

	sessionID, err := api.GenTerminalSessionID()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not generate terminal session id")
		return
	}

	api.LogSessions[sessionID] = api.LogSession{
		ClientSet: clientset,
		URL:       request.URL,
	}

	middleware.Write(w, r, api.TerminalResponse{ID: sessionID})
	return
}
