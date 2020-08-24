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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	_, clientset, err := kube.ConfigClientset(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second, request.Proxy)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	result, err := api.KubernetesRequest(r.Context(), request.Method, request.URL, request.Body, clientset)
	if err != nil {
		var apiError api.Error
		if err := json.Unmarshal(result, &apiError); err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
			return
		}

		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Kubernetes API request failed: %s", apiError.Message))
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

	config, clientset, err := kube.ConfigClientset(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second, request.Proxy)
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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	_, clientset, err := kube.ConfigClientset(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, 6*time.Hour, request.Proxy)
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

// portForwardingHandler handles the requests to initialize the port forwarding to a pod.
func portForwardingHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.PortForwardRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	config, _, err := kube.ConfigClientset(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second, request.Proxy)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	pf, err := api.NewPortForwarding(config, request.URL, request.PodPort, request.LocalPort)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not initialize port forwarding: %s", err.Error()))
		return
	}
	go pf.Start()

	middleware.Write(w, r, api.PortForwardResponse{ID: pf.ID, PodPort: pf.PodPort, LocalPort: pf.LocalPort})
	return
}

// portForwardingStopHandler handles the requests to initialize the port forwarding to a pod.
func portForwardingStopHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.PortForwardResponse
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	if _, ok := api.PortForwardSessions[request.ID]; ok {
		api.PortForwardSessions[request.ID].Stop()
	}

	middleware.Write(w, r, nil)
	return
}
