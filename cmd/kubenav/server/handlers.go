package server

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"

	"github.com/kubenav/kubenav/cmd/kubenav/kube"
	"github.com/kubenav/kubenav/cmd/kubenav/server/middleware"
	"github.com/kubenav/kubenav/cmd/kubenav/server/portforwarding"
	"github.com/kubenav/kubenav/cmd/kubenav/server/streamlogs"
	"github.com/kubenav/kubenav/cmd/kubenav/server/terminal"

	"github.com/gorilla/websocket"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/tools/remotecommand"
)

// healthHandler always returns a status ok response and can be used to check if
// the server is running or not.
func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
}

// portForwardingHandler can be used to establish a new port forwarding
// connection ("POST"), to get a list of all established connections ("GET") and
// to close a port forwarding connection ("DELETE").
func portForwardingHandler(w http.ResponseWriter, r *http.Request) {
	// The get method is used to return all user initalized session (prefixed
	// with "_user"). This is required so that wen can check if the session
	// still exists or if the session was deleted because of an error.
	if r.Method == http.MethodGet {
		var sessions []portforwarding.GetResponse

		portforwarding.Sessions.Lock.RLock()
		defer portforwarding.Sessions.Lock.RUnlock()

		for _, session := range portforwarding.Sessions.Sessions {
			if strings.HasPrefix(session.ID, "user_") {
				sessions = append(sessions, portforwarding.GetResponse{
					ID:         session.ID,
					Name:       session.Name,
					Namespace:  session.Namespace,
					Container:  session.Container,
					RemotePort: session.RemotePort,
					LocalPort:  session.LocalPort,
				})
			}
		}

		middleware.Write(w, r, struct {
			Sessions []portforwarding.GetResponse `json:"sessions"`
		}{
			sessions,
		})
		return
	}

	// The POST method is used to create a new port forwarding session. When the
	// session was successfully initialized and started, we return the session
	// id which can be used to delete a session and the used local port from the
	// session which can then used by the user to interact with the selected
	// remote port.
	if r.Method == http.MethodPost {
		if r.Body == nil {
			middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
			return
		}

		var request portforwarding.CreateRequest
		err := json.NewDecoder(r.Body).Decode(&request)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
			return
		}

		restConfig, clientset, err := kube.NewClient(request.ClusterServer, request.ClusterCertificateAuthorityData, request.ClusterInsecureSkipTLSVerify, request.UserClientCertificateData, request.UserClientKeyData, request.UserToken, request.UserUsername, request.UserPassword, request.Proxy, 0)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
			return
		}

		// If the request doesn't contain a pod name, container and port number,
		// we assume that the port forwarding request was initialized via a
		// service. This means that we have to get all pods for this service via
		// it's selector and then we have to get the container and port from the
		// pods manifest file.
		if request.PodName == "" && request.PodContainer == "" && request.PodPort == 0 {
			pods, err := clientset.CoreV1().Pods(request.PodNamespace).List(r.Context(), metav1.ListOptions{
				LabelSelector: request.ServiceSelector,
			})
			if err != nil {
				middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not get pods: %s", err.Error()))
				return
			}

			if pods == nil || len(pods.Items) == 0 {
				middleware.Errorf(w, r, err, http.StatusBadRequest, "Could not get pods")
				return
			}

			request.PodName = pods.Items[0].Name
			request.PodContainer, request.PodPort = getPodContainerAndPort(pods.Items[0], request.ServiceTargetPort)

			if request.PodContainer == "" || request.PodPort == 0 {
				middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not determine container (%s) and port (%d): %s %s %s", request.PodContainer, request.PodPort, request.PodNamespace, request.ServiceSelector, request.ServiceTargetPort))
				return
			}
		}

		// Create a new session for port forwarding and start the portforwarding
		// request. Then we wait until the connection is ready, befor we return
		// the request to the user.
		pf, err := portforwarding.CreateSession("user_", request.PodName, request.PodNamespace, request.PodContainer, request.PodPort)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not initialize port forwarding: %s", err.Error()))
			return
		}

		errCh := make(chan error, 1)

		go func() {
			err := pf.Start(restConfig, fmt.Sprintf("/api/v1/namespaces/%s/pods/%s/portforward", request.PodNamespace, request.PodName), request.PodPort)
			if err != nil {
				errCh <- err
			}
		}()

		select {
		case err := <-errCh:
			middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not establish port forwarding connection: %s", err.Error()))
			return
		case <-pf.ReadyCh:
			break
		}

		middleware.Write(w, r, portforwarding.GetResponse{
			ID:         pf.ID,
			Name:       pf.Name,
			Namespace:  pf.Namespace,
			Container:  pf.Container,
			RemotePort: pf.RemotePort,
			LocalPort:  pf.LocalPort,
		})
		return
	}

	// The DELETE method is used to delete a port forwarding session and to
	// close the underlying port forwarding
	// connection.
	if r.Method == http.MethodDelete {
		var request portforwarding.DeleteRequest
		if r.Body == nil {
			middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
			return
		}
		err := json.NewDecoder(r.Body).Decode(&request)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
			return
		}

		if session, ok := portforwarding.Sessions.Get(request.SessionID); ok {
			close(session.StopCh)
			portforwarding.Sessions.Delete(session.ID)
		}

		middleware.Write(w, r, nil)
		return
	}

	middleware.Write(w, r, nil)
}

// terminalHandler handles exec requests to a container via WebSockets.
func terminalHandler(w http.ResponseWriter, r *http.Request) {
	// The Pod data (name and namespace) as well as the container and shell are
	// send via query parameters. While the credentials required to authenticate
	// against the Kubernetes API must be send via our custom headers.
	name := r.URL.Query().Get("name")
	namespace := r.URL.Query().Get("namespace")
	container := r.URL.Query().Get("container")
	shell := r.URL.Query().Get("shell")

	clusterServer := r.Header.Get("X-CLUSTER-SERVER")
	clusterCertificateAuthorityData := r.Header.Get("X-CLUSTER-CERTIFICATE-AUTHORITY-DATA")
	clusterInsecureSkipTLSVerify := r.Header.Get("X-CLUSTER-INSECURE-SKIP-TLS-VERIFY")
	userClientCertificateData := r.Header.Get("X-USER-CLIENT-CERTIFICATE-DATA")
	userClientKeyData := r.Header.Get("X-USER-CLIENT-KEY-DATA")
	userToken := r.Header.Get("X-USER-TOKEN")
	userUsername := r.Header.Get("X-USER-USERNAME")
	userPassword := r.Header.Get("X-USER-PASSWORD")
	proxy := r.Header.Get("X-PROXY")

	parsedClusterInsecureSkipTLSVerify, err := strconv.ParseBool(clusterInsecureSkipTLSVerify)
	if err != nil {
		parsedClusterInsecureSkipTLSVerify = false
	}

	restConfig, _, err := kube.NewClient(clusterServer, clusterCertificateAuthorityData, parsedClusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, 0)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes client: %s", err.Error()))
		return
	}

	// After we create a client to interact with the Kubernetes API, we can
	// upgrade the underlying http connection, to get a shell into the requested
	// container.
	//
	// We also setup the ping and pong handlers, so that the WebSocket
	// connection isn't closed, when the user doesn't send any data for a while.
	var upgrader = websocket.Upgrader{}
	upgrader.CheckOrigin = func(r *http.Request) bool { return true }

	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not upgrade connection: %s", err.Error()))
		return
	}
	defer c.Close()

	c.SetPongHandler(func(string) error { return nil })

	go func() {
		ticker := time.NewTicker(30 * time.Second)
		defer ticker.Stop()

		for range ticker.C {
			if err := c.WriteMessage(websocket.PingMessage, nil); err != nil {
				return
			}
		}
	}()

	// After our WebSocket connection is established, we create the request url
	// for the Kubernetes API to get a terminal into the requested container.
	//
	// We also validating the user defined shell and fallback to "sh" when it
	// was invalid.
	reqURL, err := url.Parse(fmt.Sprintf("%s/api/v1/namespaces/%s/pods/%s/exec?container=%s&command=%s&stdin=true&stdout=true&stderr=true&tty=true", restConfig.Host, namespace, name, container, shell))
	if err != nil {
		msg, _ := json.Marshal(terminal.Message{
			Op:   "stdout",
			Data: fmt.Sprintf("Could not create request url: %s", err.Error()),
		})
		c.WriteMessage(websocket.TextMessage, msg)
		return
	}

	if !terminal.IsValidShell(shell) {
		shell = "sh"
	}
	cmd := []string{shell}

	// Finally we create a new terminal session and we are starting the terminal
	// process, where the communication between the user and the container
	// happens via the WebSocket connection we established before.
	session := &terminal.Session{
		WebSocket: c,
		SizeChan:  make(chan remotecommand.TerminalSize),
	}

	err = terminal.StartProcess(r.Context(), restConfig, reqURL, cmd, session)
	if err != nil {
		msg, _ := json.Marshal(terminal.Message{
			Op:   "stdout",
			Data: fmt.Sprintf("Could not create terminal: %s", err.Error()),
		})
		c.WriteMessage(websocket.TextMessage, msg)
		return
	}
}

func logsHandler(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	namespace := r.URL.Query().Get("namespace")
	container := r.URL.Query().Get("container")
	since := r.URL.Query().Get("since")

	parsedSince, err := strconv.ParseInt(since, 10, 64)
	if err != nil {
		parsedSince = 300
	}

	clusterServer := r.Header.Get("X-CLUSTER-SERVER")
	clusterCertificateAuthorityData := r.Header.Get("X-CLUSTER-CERTIFICATE-AUTHORITY-DATA")
	clusterInsecureSkipTLSVerify := r.Header.Get("X-CLUSTER-INSECURE-SKIP-TLS-VERIFY")
	userClientCertificateData := r.Header.Get("X-USER-CLIENT-CERTIFICATE-DATA")
	userClientKeyData := r.Header.Get("X-USER-CLIENT-KEY-DATA")
	userToken := r.Header.Get("X-USER-TOKEN")
	userUsername := r.Header.Get("X-USER-USERNAME")
	userPassword := r.Header.Get("X-USER-PASSWORD")
	proxy := r.Header.Get("X-PROXY")

	parsedClusterInsecureSkipTLSVerify, err := strconv.ParseBool(clusterInsecureSkipTLSVerify)
	if err != nil {
		parsedClusterInsecureSkipTLSVerify = false
	}

	_, clientset, err := kube.NewClient(clusterServer, clusterCertificateAuthorityData, parsedClusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, 0)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes client: %s", err.Error()))
		return
	}

	// After we create a client to interact with the Kubernetes API, we can
	// upgrade the underlying http connection, to stream the logs of the
	// requested container.
	//
	// We also setup the ping and pong handlers, so that the WebSocket
	// connection isn't closed, when the user doesn't send any data for a while.
	var upgrader = websocket.Upgrader{}
	upgrader.CheckOrigin = func(r *http.Request) bool { return true }

	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not upgrade connection: %s", err.Error()))
		return
	}
	defer c.Close()

	c.SetPongHandler(func(string) error { return nil })

	go func() {
		ticker := time.NewTicker(30 * time.Second)
		defer ticker.Stop()

		for range ticker.C {
			if err := c.WriteMessage(websocket.PingMessage, nil); err != nil {
				return
			}
		}
	}()

	// Stream the logs of the selected container via the created WebSocket
	// connection.
	err = streamlogs.StreamLogs(r.Context(), clientset, c, namespace, name, container, parsedSince)
	if err != nil {
		c.WriteMessage(websocket.TextMessage, []byte("Could not stream logs: "+err.Error()))
		return
	}
}
