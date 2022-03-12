package server

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/server/middleware"
	"github.com/kubenav/kubenav/pkg/server/portforwarding"
)

// HealthHandler always returns a status ok response and can be used to check if the server is running or not.
func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
}

// PortForwardingHandler can be used to establish a new port forwarding connection ("POST"), to get a list of all
// established connections ("GET") and to close a port forwarding connection ("DELETE").
func portForwardingHandler(w http.ResponseWriter, r *http.Request) {
	// The get method is used to return all user initalized session (prefixed with "_user"). This is required so that
	// wen can check if the session still exists or if the session was deleted because of an error.
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

	// The POST method is used to create a new port forwarding session. When the session was successfully initialized
	// and started, we return the session id which can be used to delete a session and the used local port from the
	// session which can then used by the user to interact with the selected remote port.
	if r.Method == http.MethodPost {
		var request portforwarding.CreateRequest
		if r.Body == nil {
			middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
			return
		}
		err := json.NewDecoder(r.Body).Decode(&request)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
			return
		}

		restConfig, _, err := kube.GetClient(request.ClusterServer, request.ClusterCertificateAuthorityData, request.ClusterInsecureSkipTLSVerify, request.UserClientCertificateData, request.UserClientKeyData, request.UserToken, request.UserUsername, request.UserPassword)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create Kubernetes API client: %s", err.Error()))
			return
		}

		// Create a new session for port forwarding and start the portforwarding request. Then we wait until the
		// connection is ready, befor we return the request to the user.
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

		middleware.Write(w, r, struct {
			SessionID string `json:"sessionID"`
			LocalPort int64  `json:"localPort"`
		}{
			pf.ID,
			pf.LocalPort,
		})
		return
	}

	// The DELETE method is used to delete a port forwarding session and to close the underlying port forwarding
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
	return
}
