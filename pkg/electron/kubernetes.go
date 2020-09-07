package electron

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
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

	_, clientset, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second, request.Proxy)
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

	config, clientset, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second, request.Proxy)
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
	requestURL, err := url.Parse(request.URL)
	if err == nil {
		commands, ok := requestURL.Query()["command"]
		if ok || len(commands[0]) >= 1 {
			shell = commands[0]
		}
	}

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

	_, clientset, err := client.ConfigClientset(request.Cluster, 6*time.Hour, request.Proxy)
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

// portForwardingHandler handles all requests related to port forwarding.
//   - GET: Return all active port forwarding sessions
//   - POST: Initialize a new port forwarding session
//   - DELETE: Delete a port forwarding session
func portForwardingHandler(w http.ResponseWriter, r *http.Request) {
	// GET returns all active port forwarding sessions. We filter the active sessions to exclude the sessions needed for
	// plugins.
	if r.Method == http.MethodGet {
		var sessions []api.PortForwardResponse

		for _, session := range api.PortForwardSessions {
			if !strings.HasPrefix(session.ID, "plugins_") {
				sessions = append(sessions, api.PortForwardResponse{
					ID:           session.ID,
					PodName:      session.PodName,
					PodNamespace: session.PodNamespace,
					PodPort:      session.PodPort,
					LocalPort:    session.LocalPort,
				})
			}
		}

		middleware.Write(w, r, sessions)
		return
	}

	// POST initializes a new port forwarding session and returns the session ID the pod data and the used local Port,
	// which is randomly specified when the user choosed 0 as local pod.
	if r.Method == http.MethodPost {
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

		config, _, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second, request.Proxy)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
			return
		}

		pf, err := api.NewPortForwarding(config, "", request.URL, request.PodName, request.PodNamespace, request.PodPort, request.LocalPort)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not initialize port forwarding: %s", err.Error()))
			return
		}
		go pf.Start()

		middleware.Write(w, r, api.PortForwardResponse{
			ID:           pf.ID,
			PodName:      request.PodName,
			PodNamespace: request.PodNamespace,
			PodPort:      pf.PodPort,
			LocalPort:    pf.LocalPort,
		})
		return
	}

	// DELETE closes a port forwarding session by the specified session id.
	if r.Method == http.MethodDelete {
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

	middleware.Write(w, r, nil)
	return
}

// pluginHandler handles all requests for plugins
func pluginHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request api.PluginRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	config, clientset, err := client.ConfigClientset(request.Cluster, time.Duration(request.Timeout)*time.Second, request.Proxy)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	data, err := api.DoPluginAction(config, clientset, request.Name, request.URL, request.Port, request.Data)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("An error occured: %s", err.Error()))
		return
	}

	middleware.Write(w, r, data)
	return
}
