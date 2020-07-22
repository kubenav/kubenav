package electron

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/api/middleware"

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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	_, clientset, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	result, err := api.KubernetesRequest(r.Context(), request.Method, request.URL, request.Body, clientset)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	config, clientset, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	sessionID, err := api.GenTerminalSessionID()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not generate terminal session id: %s", err.Error()))
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

// logsHandler generates the clientset and an id for streaming logs.
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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	_, clientset, err := client.ConfigClientset(request.Cluster, 6*time.Hour)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	sessionID, err := api.GenTerminalSessionID()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not generate terminal session id: %s", err.Error()))
		return
	}

	api.LogSessions[sessionID] = api.LogSession{
		ClientSet: clientset,
		URL:       request.URL,
	}

	middleware.Write(w, r, api.TerminalResponse{ID: sessionID})
	return
}

// sshHandler handles SSH connections to a node
func sshHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.SSHRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	sessionID, err := api.GenTerminalSessionID()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not generate terminal session id: %s", err.Error()))
		return
	}

	api.TerminalSessions.Set(sessionID, api.TerminalSession{
		ID:       sessionID,
		Bound:    make(chan error),
		SizeChan: make(chan remotecommand.TerminalSize),
	})

	go api.WaitForSSH(request.Key, request.Address, request.User, sessionID)

	middleware.Write(w, r, api.TerminalResponse{ID: sessionID})
	return
}
