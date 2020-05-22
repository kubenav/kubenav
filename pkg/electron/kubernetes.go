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
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	_, clientset, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create clientset")
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

	config, clientset, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second)
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
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	_, clientset, err := client.ConfigClientset(request.Cluster, 1*time.Hour)
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

	/*if r.Method != http.MethodPost {
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

	_, clientset, err := client.ConfigClientset(request.Cluster, 1*time.Hour)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create clientset")
		return
	}

	readCloser, err := clientset.RESTClient().Get().RequestURI(request.URL).Stream()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not stream logs: %s", err.Error()))
		return
	}
	defer readCloser.Close()

	w.Header().Set("Connection", "keep-alive")
	w.Header().Set("Content-Type", "text/event-stream")
	w.Header().Set("Access-Control-Allow-Origin", "*")

	for {
		select {
		case <-r.Context().Done():
			fmt.Println("close sse")
			middleware.Write(w, r, nil)
			return
		default:
			p := make([]byte, 2048)
			n, err := readCloser.Read(p)
			if err != nil {
				if err == io.EOF {
					middleware.Write(w, r, nil)
					return
				}

				middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not stream logs: %s", err.Error()))
				return
			}

			if string(p[:n]) != "" {
				w.Write([]byte(fmt.Sprintf("data: %s\n\n", string(p[:n]))))
				w.(http.Flusher).Flush()
			}
		}
	}*/
}
