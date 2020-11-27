// Package terminal implements the functions for all terminal interactions in the frontend. These includes to get a
// shell into a Pod, SSH sessions for a Node and the streaming of log files.
// The implementation is very similar to the implementation in the "Kubernetes Dashboard", you can find the file
// here: https://github.com/kubernetes/dashboard/blob/master/src/app/backend/handler/terminal.go
package terminal

import (
	"crypto/rand"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"sync"

	log "github.com/sirupsen/logrus"
	"gopkg.in/igm/sockjs-go.v2/sockjs"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/remotecommand"
)

const END_OF_TRANSMISSION = "\u0004"

// TerminalResponse is sent by execHandler. The ID is a random session id that binds the original REST request and the
// SockJS connection. Any clientapi in possession of this Id can hijack the terminal session.
type TerminalResponse struct {
	ID string `json:"id"`
}

// PtyHandler is what remotecommand expects from a pty.
type PtyHandler interface {
	io.Reader
	io.Writer
	remotecommand.TerminalSizeQueue
	GetSizeChan() chan remotecommand.TerminalSize
}

// TerminalSession implements PtyHandler (using a SockJS connection).
type TerminalSession struct {
	ID            string
	Bound         chan error
	SockJSSession sockjs.Session
	SizeChan      chan remotecommand.TerminalSize
	DoneChan      chan struct{}
}

// TerminalMessage is the messaging protocol between ShellController and TerminalSession.
//
// OP      DIRECTION  FIELD(S) USED  DESCRIPTION
// ---------------------------------------------------------------------
// bind    fe->be     SessionID      Id sent back from TerminalResponse
// stdin   fe->be     Data           Keystrokes/paste buffer
// resize  fe->be     Rows, Cols     New terminal size
// stdout  be->fe     Data           Output from the process
type TerminalMessage struct {
	Op, Data, SessionID string
	Rows, Cols          uint16
}

// Next is called in a loop from remotecommand as long as the process is running.
// TerminalSize handles pty->process resize events.
func (t TerminalSession) Next() *remotecommand.TerminalSize {
	select {
	case size := <-t.SizeChan:
		return &size
	case <-t.DoneChan:
		return nil
	}
}

// GetSizeChan is used to support resizing for the SSH terminal.
func (t TerminalSession) GetSizeChan() chan remotecommand.TerminalSize {
	return t.SizeChan
}

// Read handles pty->process messages (stdin, resize).
// Called in a loop from remotecommand as long as the process is running.
func (t TerminalSession) Read(p []byte) (int, error) {
	m, err := t.SockJSSession.Recv()
	if err != nil {
		// Send terminated signal to process to avoid resource leak.
		return copy(p, END_OF_TRANSMISSION), err
	}

	var msg TerminalMessage
	if err := json.Unmarshal([]byte(m), &msg); err != nil {
		return copy(p, END_OF_TRANSMISSION), err
	}

	switch msg.Op {
	case "stdin":
		return copy(p, msg.Data), nil
	case "resize":
		t.SizeChan <- remotecommand.TerminalSize{Width: msg.Cols, Height: msg.Rows}
		return 0, nil
	default:
		return copy(p, END_OF_TRANSMISSION), fmt.Errorf("unknown message type '%s'", msg.Op)
	}
}

// Write handles process->pty stdout.
// Called from remotecommand whenever there is any output.
func (t TerminalSession) Write(p []byte) (int, error) {
	msg, err := json.Marshal(TerminalMessage{
		Op:   "stdout",
		Data: string(p),
	})
	if err != nil {
		return 0, err
	}

	if err = t.SockJSSession.Send(string(msg)); err != nil {
		return 0, err
	}
	return len(p), nil
}

// SessionMap stores a map of all TerminalSession objects and a lock to avoid concurrent conflict.
type SessionMap struct {
	Sessions map[string]TerminalSession
	Lock     sync.RWMutex
}

// Get return a given terminalSession by sessionID.
func (sm *SessionMap) Get(sessionID string) TerminalSession {
	sm.Lock.RLock()
	defer sm.Lock.RUnlock()
	return sm.Sessions[sessionID]
}

// Set store a TerminalSession to SessionMap.
func (sm *SessionMap) Set(sessionID string, session TerminalSession) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()
	sm.Sessions[sessionID] = session
}

// Close shuts down the SockJS connection and sends the status code and reason to the client.
// Can happen if the process exits or if there is an error starting up the process.
// For now the status code is unused and reason is shown to the user (unless "").
func (sm *SessionMap) Close(sessionID string, status uint32, reason string) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()
	err := sm.Sessions[sessionID].SockJSSession.Close(status, reason)
	if err != nil {
		log.WithError(err).Errorf("SockJS connection was closed")
	}

	delete(sm.Sessions, sessionID)
}

// TerminalSessions holds all active terminal sessions.
var TerminalSessions = SessionMap{Sessions: make(map[string]TerminalSession)}

// handleTerminalSession is Called by net/http for any new /api/kubernetes/exec/sockjs connections.
func handleTerminalSession(session sockjs.Session) {
	var (
		buf             string
		err             error
		msg             TerminalMessage
		terminalSession TerminalSession
	)

	if buf, err = session.Recv(); err != nil {
		return
	}

	if err = json.Unmarshal([]byte(buf), &msg); err != nil {
		return
	}

	if msg.Op != "bind" {
		return
	}

	if terminalSession = TerminalSessions.Get(msg.SessionID); terminalSession.ID == "" {
		return
	}

	terminalSession.SockJSSession = session
	TerminalSessions.Set(msg.SessionID, terminalSession)
	terminalSession.Bound <- nil
}

// CreateAttachHandler is called from main for /api/kubernetes/exec/sockjs.
func CreateAttachHandler(path string) http.Handler {
	return sockjs.NewHandler(path, sockjs.DefaultOptions, handleTerminalSession)
}

// startProcess is called by execHandler.
// Executed cmd in the container specified in request and connects it up with the ptyHandler (a session).
func startProcess(config *rest.Config, clientset *kubernetes.Clientset, reqURL *url.URL, cmd []string, ptyHandler PtyHandler) error {
	exec, err := remotecommand.NewSPDYExecutor(config, "POST", reqURL)
	if err != nil {
		return err
	}

	err = exec.Stream(remotecommand.StreamOptions{
		Stdin:             ptyHandler,
		Stdout:            ptyHandler,
		Stderr:            ptyHandler,
		TerminalSizeQueue: ptyHandler,
		Tty:               true,
	})
	if err != nil {
		return err
	}

	return nil
}

// GenTerminalSessionID generates a random session ID string. The format is not really interesting.
// This ID is used to identify the session when the client opens the SockJS connection.
// Not the same as the SockJS session id! We can't use that as that is generated on the client side and we don't have it
// yet at this point.
func GenTerminalSessionID() (string, error) {
	bytes := make([]byte, 16)
	if _, err := rand.Read(bytes); err != nil {
		return "", err
	}
	id := make([]byte, hex.EncodedLen(len(bytes)))
	hex.Encode(id, bytes)
	return string(id), nil
}

// isValidShell checks if the shell is an allowed one.
func isValidShell(validShells []string, shell string) bool {
	for _, validShell := range validShells {
		if validShell == shell {
			return true
		}
	}
	return false
}

// WaitForTerminal is called from execHandler as a goroutine.
// Waits for the SockJS connection to be opened by the client the session to be bound in handleTerminalSession.
func WaitForTerminal(config *rest.Config, clientset *kubernetes.Clientset, reqURL *url.URL, shell string, sessionID string) {
	select {
	case <-TerminalSessions.Get(sessionID).Bound:
		close(TerminalSessions.Get(sessionID).Bound)

		var err error
		validShells := []string{"bash", "sh", "powershell", "cmd"}

		if isValidShell(validShells, shell) {
			cmd := []string{shell}
			err = startProcess(config, clientset, reqURL, cmd, TerminalSessions.Get(sessionID))
		} else {
			// No shell given or it was not valid: try some shells until one succeeds or all fail.
			for _, testShell := range validShells {
				cmd := []string{testShell}
				if err = startProcess(config, clientset, reqURL, cmd, TerminalSessions.Get(sessionID)); err == nil {
					break
				}
			}
		}

		if err != nil {
			log.WithError(err).Errorf("Terminal session was closed")
			TerminalSessions.Close(sessionID, 2, err.Error())
			return
		}

		TerminalSessions.Close(sessionID, 1, "Process exited")
	}
}
