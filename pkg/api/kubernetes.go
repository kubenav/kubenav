package api

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/kubenav/kubenav/pkg/api/kubernetes"
	"github.com/kubenav/kubenav/pkg/api/middleware"

	"k8s.io/client-go/tools/remotecommand"
)

type APIRequest struct {
	Cluster                  string `json:"cluster"`
	Method                   string `json:"method"`
	URL                      string `json:"url"`
	Body                     string `json:"body"`
	CertificateAuthorityData string `json:"certificateAuthorityData"`
	ClientCertificateData    string `json:"clientCertificateData"`
	ClientKeyData            string `json:"clientKeyData"`
	Token                    string `json:"token"`
	Username                 string `json:"username"`
	Password                 string `json:"password"`
	InsecureSkipTLSVerify    bool   `json:"insecureSkipTLSVerify"`
	Timeout                  int64  `json:"timeout"`
}

type APIResponse struct {
	Data string `json:"data"`
}

type APIError struct {
	Kind       string `json:"kind"`
	APIVersion string `json:"apiVersion"`
	Status     string `json:"status"`
	Message    string `json:"message"`
	Reason     string `json:"reason"`
	Code       int    `json:"code"`
}

func requestHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request APIRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	_, clientset, err := kubernetes.Client(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create Kubernetes API client")
		return
	}

	result, err := kubernetes.Request(request.Method, request.URL, request.Body, request.Timeout, clientset)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
		return
	}

	apiResponse := APIResponse{
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

	var request APIRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	cfg, clientset, err := kubernetes.Client(request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create Kubernetes API client")
		return
	}

	sessionID, err := GenTerminalSessionID()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not generate terminal session id")
		return
	}

	TerminalSessions.Set(sessionID, TerminalSession{
		ID:       sessionID,
		Bound:    make(chan error),
		SizeChan: make(chan remotecommand.TerminalSize),
	})

	shell := ""
	go WaitForTerminal(cfg, clientset, &request, shell, sessionID)

	middleware.Write(w, r, TerminalResponse{ID: sessionID})
	return
}
