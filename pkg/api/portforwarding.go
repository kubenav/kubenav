package api

import (
	"bytes"
	"fmt"
	"net"
	"net/http"
	"net/url"
	"strconv"
	"strings"

	"github.com/kubenav/kubenav/pkg/api/middleware"

	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/portforward"
	"k8s.io/client-go/transport/spdy"
)

// PortForwardRequest is the structure of a request to initalize the port forwarding.
type PortForwardRequest struct {
	Request
	PodPort   int64 `json:"podPort"`
	LocalPort int64 `json:"localPort"`
}

// PortForwardResponse is the structure of an initialized port forwarding request. It contains the session id which can
// be used to close the opened port and the port number.
type PortForwardResponse struct {
	ID        string `json:"id"`
	PodPort   int64  `json:"podPort"`
	LocalPort int64  `json:"localPort"`
}

// PortForwardSessions holds all open port forwarding sessions.
var PortForwardSessions = make(map[string]*PortForward)

// PortForward is the structure with all needed data for a port forwarding.
type PortForward struct {
	ID        string
	PodPort   int64
	LocalPort int64

	forwarder *portforward.PortForwarder
	readyChan chan struct{}
	stopChan  chan struct{}
	out       *bytes.Buffer
	errOut    *bytes.Buffer
}

// ActivePortForwardingSessions returns all active port forwarding sessions.
func ActivePortForwardingSessions(w http.ResponseWriter, r *http.Request) {
	middleware.Write(w, r, PortForwardSessions)
	return
}

// NewPortForwarding returns a new PortForward struct with all details needed to start the port forwarding. It also adds
// it to the map of port forwarding sessions.
// When the local port is 0 a random port is picked.
func NewPortForwarding(config *rest.Config, podURL string, podPort, localPort int64) (*PortForward, error) {
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

	sessionID, err := GenTerminalSessionID()
	if err != nil {
		return nil, err
	}

	pf := &PortForward{
		ID:        sessionID,
		PodPort:   podPort,
		LocalPort: localPort,

		forwarder: forwarder,
		readyChan: readyChan,
		stopChan:  stopChan,
		errOut:    errOut,
		out:       out,
	}

	PortForwardSessions[sessionID] = pf

	return pf, nil
}

// Start starts the port forwarding.
func (pf *PortForward) Start() {
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
		delete(PortForwardSessions, pf.ID)
		return
	}
}

// Stop stops the port forwarding.
func (pf *PortForward) Stop() {
	pf.stopChan <- struct{}{}
	delete(PortForwardSessions, pf.ID)
}
