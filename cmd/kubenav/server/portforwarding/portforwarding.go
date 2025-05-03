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

	"k8s.io/cli-runtime/pkg/genericclioptions"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/portforward"
	"k8s.io/client-go/transport/spdy"
)

// CreateRequest is the structure of a request to initalize a port forwarding
// session. It contains all the required fields to create a Kubernetes client as
// well as the pod name and namespace and the port which should be forwarded.
type CreateRequest struct {
	ClusterServer                   string `json:"clusterServer"`
	ClusterCertificateAuthorityData string `json:"clusterCertificateAuthorityData"`
	ClusterInsecureSkipTLSVerify    bool   `json:"clusterInsecureSkipTLSVerify"`
	UserClientCertificateData       string `json:"userClientCertificateData"`
	UserClientKeyData               string `json:"userClientKeyData"`
	UserToken                       string `json:"userToken"`
	UserUsername                    string `json:"userUsername"`
	UserPassword                    string `json:"userPassword"`
	Proxy                           string `json:"proxy"`
	Timeout                         int64  `json:"timeout"`
	PodName                         string `json:"podName"`
	PodNamespace                    string `json:"podNamespace"`
	PodContainer                    string `json:"podContainer"`
	PodPort                         int64  `json:"podPort"`
	ServiceSelector                 string `json:"serviceSelector"`
	ServiceTargetPort               string `json:"serviceTargetPort"`
}

// DeleteRequest is the structure of a request to delete a port forwarding
// session, for that is just contains the session id.
type DeleteRequest struct {
	SessionID string `json:"sessionID"`
}

// GetResponse is the structure of the returned sessions for a get request.
type GetResponse struct {
	ID         string `json:"id"`
	Name       string `json:"name"`
	Namespace  string `json:"namespace"`
	Container  string `json:"container"`
	RemotePort int64  `json:"remotePort"`
	LocalPort  int64  `json:"localPort"`
}

// Session is the structure for an establish port forwading session. It contains
// the session id, the local port which should be used for the port forwarding,
// a channel to close the connection, a channel which can be used to check if
// the connection is ready and the IO streams.
type Session struct {
	ID         string
	Name       string
	Namespace  string
	Container  string
	RemotePort int64
	LocalPort  int64
	StopCh     chan struct{}
	ReadyCh    chan struct{}
	Streams    genericclioptions.IOStreams
}

// CreateSession creates a new port forwarding session. To create a new session
// the function requires a session prefix, which can be used to differentiate
// between user initiated sessions and plugin sessions.
func CreateSession(sessionPrefix, name, namespace, container string, remotePort int64) (*Session, error) {
	// in the first step we have to create a random session id, which is
	// prefixed with the given "sessionPrefix". The prefixed can be used to
	// differentiate between user and plugin sessions.
	sessionID, err := genSessionID()
	if err != nil {
		return nil, err
	}
	sessionID = sessionPrefix + sessionID

	// In the next step we have to create a listener, so that we can bound the
	// remote port to a random local port.
	listener, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		return nil, err
	}

	defer listener.Close()

	localPort, err := strconv.ParseInt(strings.TrimPrefix(listener.Addr().String(), "127.0.0.1:"), 10, 64)
	if err != nil {
		return nil, err
	}

	stopCh := make(chan struct{}, 1)
	readyCh := make(chan struct{})
	streams := genericclioptions.IOStreams{}

	pf := &Session{
		ID:         sessionID,
		Name:       name,
		Namespace:  namespace,
		Container:  container,
		RemotePort: remotePort,
		LocalPort:  localPort,
		StopCh:     stopCh,
		ReadyCh:    readyCh,
		Streams:    streams,
	}

	Sessions.Set(sessionID, pf)

	return pf, nil
}

// Start starts the port forwarding request. For that we are need a rest config
// to interact with the Kubernets API, the request path for the port forwarding
// endpoint and the remote port shich should be forwarded.
func (s *Session) Start(restConfig *rest.Config, path string, remotePort int64) error {
	// In the first step we have to create the full request url. For this we are
	// joining the host from the rest config, with the given path. In the case
	// that the host ends with a "/" and the path starts with a "/" we are
	// removing the "/" from the path, so that the request url doesn't contain
	// "//". To use the request url in the port forwarding request we have to
	// parse it.
	requestURL := restConfig.Host + path
	if strings.HasSuffix(restConfig.Host, "/") && strings.HasPrefix(path, "/") {
		requestURL = strings.TrimSuffix(restConfig.Host, "/") + path
	}

	parsedRequestURL, err := url.Parse(requestURL)
	if err != nil {
		return err
	}

	// Finally we can create our transporter and upgrader which can be used with
	// SPDY. The transporter and upgrader are then used to create a new dialer
	// that connects to the provided URL and upgrades the connection to SPDY.
	// The dialer is then used to forward the requested port.
	transport, upgrader, err := spdy.RoundTripperFor(restConfig)
	if err != nil {
		return err
	}

	dialer := spdy.NewDialer(upgrader, &http.Client{Transport: transport}, http.MethodPost, parsedRequestURL)
	pf, err := portforward.New(dialer, []string{fmt.Sprintf("%d:%d", s.LocalPort, remotePort)}, s.StopCh, s.ReadyCh, s.Streams.Out, s.Streams.ErrOut)
	if err != nil {
		return err
	}

	return pf.ForwardPorts()
}

// genSessionID generates a random session ID string. This ID can be used to
// interact with the underlying port forwarding session (e.g. close the port
// forwarding session).
func genSessionID() (string, error) {
	bytes := make([]byte, 16)
	if _, err := rand.Read(bytes); err != nil {
		return "", err
	}
	id := make([]byte, hex.EncodedLen(len(bytes)))
	hex.Encode(id, bytes)
	return string(id), nil
}
