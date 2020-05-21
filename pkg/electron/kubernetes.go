package electron

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/api/kubernetes"
	"github.com/kubenav/kubenav/pkg/api/middleware"

	"k8s.io/client-go/tools/remotecommand"
)

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

	_, clientset, err := client.KubernetesClient(request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create clientset")
		return
	}

	result, err := kubernetes.Request(request.Method, request.URL, request.Body, request.Timeout, clientset)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
		return
	}

	apiResponse := api.APIResponse{
		Data: strings.TrimSuffix(string(result), "\n"),
	}

	middleware.Write(w, r, apiResponse)
	return
}

func execHandler(w http.ResponseWriter, r *http.Request) {
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

	cfg, clientset, err := client.KubernetesClient(request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create clientset")
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
	go api.WaitForTerminal(cfg, clientset, &request, shell, sessionID)

	middleware.Write(w, r, api.TerminalResponse{ID: sessionID})
	return
}
