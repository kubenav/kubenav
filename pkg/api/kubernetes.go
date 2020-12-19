package api

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"strings"
	"time"

	"github.com/kubenav/kubenav/pkg/api/middleware"
	"github.com/kubenav/kubenav/pkg/handlers/plugins"
	"github.com/kubenav/kubenav/pkg/handlers/portforwarding"
	"github.com/kubenav/kubenav/pkg/handlers/terminal"
	"github.com/kubenav/kubenav/pkg/kube"

	log "github.com/sirupsen/logrus"
	"k8s.io/client-go/tools/remotecommand"
)

// kubernetesRequestHandler handles the requests against the Kubernetes API server.
func (c *Client) kubernetesRequestHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request kube.Request
	if r.Body == nil {
		log.Error("Request body is empty")
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		log.WithError(err).Errorf("Could not decode request body")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	_, clientset, err := c.kubeClient.GetConfigAndClientset(request.Cluster, request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second, request.Proxy)
	if err != nil {
		log.WithError(err).Errorf("Could not create Kubernetes API client")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	result, err := kube.KubernetesRequest(r.Context(), request.Method, request.URL, request.Body, clientset)
	if err != nil {
		var apiError kube.Error
		if err := json.Unmarshal(result, &apiError); err != nil {
			log.WithError(err).Infof("Kubernetes API request failed")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
			return
		}

		log.WithError(err).Infof("Kubernetes API request failed")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Kubernetes API request failed: %s", apiError.Message))
		return
	}

	apiResponse := kube.Response{
		Data: strings.TrimSuffix(string(result), "\n"),
	}

	middleware.Write(w, r, apiResponse)
	return
}

// kubernetesExecHandler handles the requests to get a shell into a container.
func (c *Client) kubernetesExecHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request kube.Request
	if r.Body == nil {
		log.Error("Request body is empty")
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		log.WithError(err).Errorf("Could not decode request body")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	config, clientset, err := c.kubeClient.GetConfigAndClientset(request.Cluster, request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second, request.Proxy)
	if err != nil {
		log.WithError(err).Errorf("Could not create Kubernetes API client")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	sessionID, err := terminal.GenTerminalSessionID()
	if err != nil {
		log.WithError(err).Errorf("Could not generate terminal session id")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not generate terminal session id: %s", err.Error()))
		return
	}

	terminal.TerminalSessions.Set(sessionID, terminal.TerminalSession{
		ID:       sessionID,
		Bound:    make(chan error),
		SizeChan: make(chan remotecommand.TerminalSize),
	})

	shell := ""
	reqURL, err := url.Parse(request.URL)
	if err == nil {
		commands, ok := reqURL.Query()["command"]
		if ok || len(commands[0]) >= 1 {
			shell = commands[0]
		}
	}

	go terminal.WaitForTerminal(config, clientset, reqURL, shell, sessionID)
	time.Sleep(1 * time.Second)

	middleware.Write(w, r, terminal.TerminalResponse{ID: sessionID})
	return
}

// kubernetesLogsHandler generates the clientset and an id for streaming logs.
func (c *Client) kubernetesLogsHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request kube.Request
	if r.Body == nil {
		log.Error("Request body is empty")
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		log.WithError(err).Errorf("Could not decode request body")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	_, clientset, err := c.kubeClient.GetConfigAndClientset(request.Cluster, request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, 6*time.Hour, request.Proxy)
	if err != nil {
		log.WithError(err).Errorf("Could not create Kubernetes API client")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
		return
	}

	sessionID, err := terminal.GenTerminalSessionID()
	if err != nil {
		log.WithError(err).Errorf("Could not generate terminal session id")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not generate terminal session id: %s", err.Error()))
		return
	}

	terminal.LogSessions.Set(sessionID, terminal.LogSession{
		ClientSet: clientset,
		URL:       request.URL,
	})

	middleware.Write(w, r, terminal.TerminalResponse{ID: sessionID})
	return
}

// kubernetesSSHHandler handles SSH connections to a node
func (c *Client) kubernetesSSHHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var request terminal.SSHRequest
	if r.Body == nil {
		log.Error("Request body is empty")
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		log.WithError(err).Errorf("Could not decode request body")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	sessionID, err := terminal.GenTerminalSessionID()
	if err != nil {
		log.WithError(err).Errorf("Could not generate terminal session id")
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not generate terminal session id: %s", err.Error()))
		return
	}

	terminal.TerminalSessions.Set(sessionID, terminal.TerminalSession{
		ID:       sessionID,
		Bound:    make(chan error),
		SizeChan: make(chan remotecommand.TerminalSize),
	})

	go terminal.WaitForSSH(request.Key, request.Address, request.User, sessionID)
	time.Sleep(1 * time.Second)

	middleware.Write(w, r, terminal.TerminalResponse{ID: sessionID})
	return
}

// kubernetesPortForwardingHandler handles all requests related to port forwarding.
//   - GET: Return all active port forwarding sessions.
//   - POST: Initialize a new port forwarding session.
//   - DELETE: Delete a port forwarding session.
func (c *Client) kubernetesPortForwardingHandler(w http.ResponseWriter, r *http.Request) {
	// GET returns all active port forwarding sessions. We filter the active sessions to exclude the sessions needed for
	// plugins.
	if r.Method == http.MethodGet {
		var sessions []portforwarding.PortForwarding

		portforwarding.Sessions.Lock.RLock()
		defer portforwarding.Sessions.Lock.RUnlock()

		for _, session := range portforwarding.Sessions.Sessions {
			if !strings.HasPrefix(session.ID, "plugins_") {
				sessions = append(sessions, portforwarding.PortForwarding{
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
		var request portforwarding.Request
		if r.Body == nil {
			log.Error("Request body is empty")
			middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
			return
		}
		err := json.NewDecoder(r.Body).Decode(&request)
		if err != nil {
			log.WithError(err).Errorf("Could not decode request body")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
			return
		}

		config, _, err := c.kubeClient.GetConfigAndClientset(request.Cluster, request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, time.Duration(request.Timeout)*time.Second, request.Proxy)
		if err != nil {
			log.WithError(err).Errorf("Could not create Kubernetes API client")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
			return
		}

		// Create a new session for port forwarding and start the portforwarding request. Then we wait until the
		// connection is ready, befor we return the request to the user.
		pf, err := portforwarding.CreateSession("", request.PodName, request.PodNamespace, request.PodPort, request.LocalPort, config)
		if err != nil {
			log.WithError(err).Errorf("Could not initialize port forwarding")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not initialize port forwarding: %s", err.Error()))
			return
		}

		go func() {
			err := pf.Start("")
			if err != nil {
				log.WithError(err).Errorf("Port forwarding was stopped")
			}
		}()

		select {
		case <-pf.ReadyCh:
			log.Debug("Port forwarding is ready")
			break
		}

		middleware.Write(w, r, portforwarding.PortForwarding{
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
		var request portforwarding.PortForwarding
		if r.Body == nil {
			log.Error("Request body is empty")
			middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
			return
		}
		err := json.NewDecoder(r.Body).Decode(&request)
		if err != nil {
			log.WithError(err).Errorf("Could not decode request body")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
			return
		}

		if session, ok := portforwarding.Sessions.Get(request.ID); ok {
			close(session.StopCh)
			portforwarding.Sessions.Delete(session.ID)
		}

		middleware.Write(w, r, nil)
		return
	}

	middleware.Write(w, r, nil)
	return
}

// kubernetesPluginHandler handles all requests for plugins.
//   - GET: Return the settings for plugins.
//   - POST: Executes the action for a plugin.
func (c *Client) kubernetesPluginHandler(w http.ResponseWriter, r *http.Request) {
	// GET returns the server side configured settings for a plugin. This is only used for kubenav when it runs inside
	// a Kubernetes cluster and allows us to enable a plugin via a command-line flag and to use the cluster URL of this
	// plugin. So we haven't to use port forwarding when running inside a Kubernetes cluster.
	if r.Method == http.MethodGet {
		middleware.Write(w, r, c.pluginConfig)
		return
	}

	// POST executes the plugin logic. For example the Prometheus plugin allows us to run queries against Prometheus and
	// visulize the results in our React app.
	if r.Method == http.MethodPost {
		var request plugins.Request
		if r.Body == nil {
			log.Error("Request body is empty")
			middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
			return
		}
		err := json.NewDecoder(r.Body).Decode(&request)
		if err != nil {
			log.WithError(err).Errorf("Could not decode request body")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
			return
		}

		requestTimeout := time.Duration(request.Timeout) * time.Second
		config, clientset, err := c.kubeClient.GetConfigAndClientset(request.Cluster, request.URL, request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.Token, request.Username, request.Password, request.InsecureSkipTLSVerify, requestTimeout, request.Proxy)
		if err != nil {
			log.WithError(err).Errorf("Could not create Kubernetes API client")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
			return
		}

		data, err := plugins.Run(request, config, clientset, requestTimeout, c.pluginConfig)
		if err != nil {
			log.WithError(err).Errorf("An error occured while running the plugin")
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("An error occured: %s", err.Error()))
			return
		}

		middleware.Write(w, r, data)
		return
	}

	middleware.Write(w, r, nil)
	return
}
