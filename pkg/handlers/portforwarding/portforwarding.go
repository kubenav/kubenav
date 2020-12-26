package portforwarding

import (
	"crypto/rand"
	"encoding/hex"
	"fmt"
	"net"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"sync"

	"github.com/kubenav/kubenav/pkg/kube"

	"k8s.io/cli-runtime/pkg/genericclioptions"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/portforward"
	"k8s.io/client-go/transport/spdy"
)

// Request is the structure of a request to initalize the port forwarding. It contains the standard fields for each
// request against the Kubernets API, plus some additional which are needed to establish the port forwarding.
type Request struct {
	kube.Request
	PortForwarding
}

// PortForwarding contains all additional fields required for the port forwarding. It contains the session id which can
// be used to close the opened port and the port number.
type PortForwarding struct {
	ID           string `json:"id"`
	PodName      string `json:"podName"`
	PodNamespace string `json:"podNamespace"`
	PodPort      int64  `json:"podPort"`
	LocalPort    int64  `json:"localPort"`
}

// Session is the structure for an establish port forwading session. Additionally to the required fields for a port
// forwarding request it contains the rest config for the Kubernetes API, a channel to close the connection, a channel
// which can be used to check if the connection is ready and the IO streams.
type Session struct {
	PortForwarding
	RestConfig *rest.Config
	StopCh     chan struct{}
	ReadyCh    chan struct{}
	Streams    genericclioptions.IOStreams
}

// SessionMap stores a map of all PortForwardSession objects and a lock to avoid concurrent conflict.
type SessionMap struct {
	Sessions map[string]*Session
	Lock     sync.RWMutex
}

// Get return a given portForwardSession by sessionID.
func (sm *SessionMap) Get(sessionID string) (*Session, bool) {
	sm.Lock.RLock()
	defer sm.Lock.RUnlock()

	session, ok := sm.Sessions[sessionID]
	return session, ok
}

// Set store a PortForwardSession to SessionMap.
func (sm *SessionMap) Set(sessionID string, session *Session) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()
	sm.Sessions[sessionID] = session
}

// Delete removes a session from the active sessions.
func (sm *SessionMap) Delete(sessionID string) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()

	if _, ok := sm.Sessions[sessionID]; ok {
		delete(sm.Sessions, sessionID)
	}
}

// Sessions holds all active port forwarding sessions.
var Sessions = SessionMap{Sessions: make(map[string]*Session)}

// genSessionID generates a random session ID string. The format is not really interesting.
// This ID is used to identify the session when the client wants to closes a port forwarding session.
func genSessionID() (string, error) {
	bytes := make([]byte, 16)
	if _, err := rand.Read(bytes); err != nil {
		return "", err
	}
	id := make([]byte, hex.EncodedLen(len(bytes)))
	hex.Encode(id, bytes)
	return string(id), nil
}

// CreateSession creates the session. For that we need the config for the Kubernetes cluster and the fields for the
// PortForwarding struct. For the session ID we pass in a prefix, which can be used to filter the sessions, so that we
// do not show sessions for plugins to the user.
// If the user do not specify a local port we randomly generate a port for the portforwarding request.
func CreateSession(sessionPrefix, podName, podNamespace string, podPort, localPort int64, restConfig *rest.Config) (*Session, error) {
	if localPort == 0 {
		listener, err := net.Listen("tcp", "127.0.0.1:0")
		if err != nil {
			return nil, err
		}

		defer listener.Close()

		localPort, err = strconv.ParseInt(strings.TrimLeft(listener.Addr().String(), "127.0.0.1:"), 10, 64)
		if err != nil {
			return nil, err
		}
	}

	sessionID, err := genSessionID()
	if err != nil {
		return nil, err
	}
	sessionID = sessionPrefix + sessionID

	stopCh := make(chan struct{}, 1)
	readyCh := make(chan struct{})
	streams := genericclioptions.IOStreams{}

	pf := &Session{
		PortForwarding{
			ID:           sessionID,
			PodName:      podName,
			PodNamespace: podNamespace,
			PodPort:      podPort,
			LocalPort:    localPort,
		},
		restConfig,
		stopCh,
		readyCh,
		streams,
	}

	Sessions.Set(sessionID, pf)

	return pf, nil
}

// Start starts the port forwarding request, with the data saved in the session.
func (s *Session) Start(path string) error {
	if path == "" {
		path = fmt.Sprintf("/api/v1/namespaces/%s/pods/%s/portforward", s.PodNamespace, s.PodName)
	}
	hostIP := strings.TrimLeft(s.RestConfig.Host, "htps:/")

	transport, upgrader, err := spdy.RoundTripperFor(s.RestConfig)
	if err != nil {
		return err
	}

	dialer := spdy.NewDialer(upgrader, &http.Client{Transport: transport}, http.MethodPost, &url.URL{Scheme: "https", Path: path, Host: hostIP})
	fw, err := portforward.New(dialer, []string{fmt.Sprintf("%d:%d", s.LocalPort, s.PodPort)}, s.StopCh, s.ReadyCh, s.Streams.Out, s.Streams.ErrOut)
	if err != nil {
		return err
	}

	return fw.ForwardPorts()
}
