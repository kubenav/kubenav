package portforwarding

import (
	"bytes"
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

	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/portforward"
	"k8s.io/client-go/transport/spdy"
)

// Request is the structure of a request to initalize the port forwarding.
type Request struct {
	kube.Request
	Response
}

// Response is the structure of an initialized port forwarding request. It contains the session id which can be used to
// close the opened port and the port number.
type Response struct {
	ID           string `json:"id"`
	PodName      string `json:"podName"`
	PodNamespace string `json:"podNamespace"`
	PodPort      int64  `json:"podPort"`
	LocalPort    int64  `json:"localPort"`
}

// PortForwardSession is the structure with all needed data for a port forwarding.
type PortForwardSession struct {
	ID           string
	PodName      string
	PodNamespace string
	PodPort      int64
	LocalPort    int64

	forwarder *portforward.PortForwarder
	readyChan chan struct{}
	stopChan  chan struct{}
	out       *bytes.Buffer
	errOut    *bytes.Buffer
}

// SessionMap stores a map of all PortForwardSession objects and a lock to avoid concurrent conflict.
type SessionMap struct {
	Sessions map[string]*PortForwardSession
	Lock     sync.RWMutex
}

// Get return a given portForwardSession by sessionID.
func (sm *SessionMap) Get(sessionID string) *PortForwardSession {
	sm.Lock.RLock()
	defer sm.Lock.RUnlock()
	return sm.Sessions[sessionID]
}

// Set store a PortForwardSession to SessionMap.
func (sm *SessionMap) Set(sessionID string, session *PortForwardSession) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()
	sm.Sessions[sessionID] = session
}

// Delete removes a session from the active sessions.
func (sm *SessionMap) Delete(sessionID string) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()
	delete(sm.Sessions, sessionID)
}

// Sessions holds all active port forwarding sessions.
var Sessions = SessionMap{Sessions: make(map[string]*PortForwardSession)}

// NewPortForwarding returns a new PortForward struct with all details needed to start the port forwarding. It also adds
// it to the map of port forwarding sessions.
// The sessionPrefix is used to filter the returned port forwarding sessions in our API, so that sessions for plugins
// are not included in the returned list.
// When the local port is 0 a random port is picked.
func NewPortForwarding(config *rest.Config, sessionPrefix, podURL, podName, podNamespace string, podPort, localPort int64) (*PortForwardSession, error) {
	if localPort == 0 {
		listener, err := net.Listen("tcp", "127.0.0.1:0")
		if err != nil {
			return nil, err
		}
		localPort, err = strconv.ParseInt(strings.TrimLeft(listener.Addr().String(), "127.0.0.1:"), 10, 64)
		if err != nil {
			return nil, err
		}
	}

	roundTripper, upgrader, err := spdy.RoundTripperFor(config)
	if err != nil {
		return nil, err
	}

	serverURL, err := url.Parse(podURL)
	if err != nil {
		return nil, err
	}
	dialer := spdy.NewDialer(upgrader, &http.Client{Transport: roundTripper}, http.MethodPost, serverURL)

	stopChan, readyChan := make(chan struct{}, 1), make(chan struct{}, 1)
	out, errOut := new(bytes.Buffer), new(bytes.Buffer)

	forwarder, err := portforward.New(dialer, []string{fmt.Sprintf("%d:%d", localPort, podPort)}, stopChan, readyChan, out, errOut)
	if err != nil {
		return nil, err
	}

	sessionID, err := GenSessionID()
	if err != nil {
		return nil, err
	}
	sessionID = sessionPrefix + sessionID

	pf := &PortForwardSession{
		ID:           sessionID,
		PodName:      podName,
		PodNamespace: podNamespace,
		PodPort:      podPort,
		LocalPort:    localPort,

		forwarder: forwarder,
		readyChan: readyChan,
		stopChan:  stopChan,
		errOut:    errOut,
		out:       out,
	}

	Sessions.Set(sessionID, pf)

	return pf, nil
}

// Start starts the port forwarding.
func (pf *PortForwardSession) Start() {
	go func() {
		for range pf.readyChan {
			if len(pf.errOut.String()) != 0 {
				fmt.Println(pf.errOut.String())
				pf.Stop()
				return
			} else if len(pf.out.String()) != 0 {
				fmt.Println(pf.out.String())
			}
		}
	}()

	if err := pf.forwarder.ForwardPorts(); err != nil {
		Sessions.Delete(pf.ID)
		return
	}
}

// Stop stops the port forwarding.
func (pf *PortForwardSession) Stop() {
	pf.stopChan <- struct{}{}
	Sessions.Delete(pf.ID)
}

// GenSessionID generates a random session ID string. The format is not really interesting.
// This ID is used to identify the session when the client wants to closes a port forwarding session.
func GenSessionID() (string, error) {
	bytes := make([]byte, 16)
	if _, err := rand.Read(bytes); err != nil {
		return "", err
	}
	id := make([]byte, hex.EncodedLen(len(bytes)))
	hex.Encode(id, bytes)
	return string(id), nil
}
