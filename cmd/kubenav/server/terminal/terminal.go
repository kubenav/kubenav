// Package terminal implements the functions for all terminal interactions in
// the frontend. These includes to get a shell into a Pod, SSH sessions for a
// Node and the streaming of log files. The implementation is very similar to
// the implementation in the "Kubernetes Dashboard", you can find the file
// here: https://github.com/kubernetes/dashboard/blob/master/src/app/backend/handler/terminal.go
package terminal

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/url"

	"github.com/gorilla/websocket"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/remotecommand"
)

const END_OF_TRANSMISSION = "\u0004"

// PtyHandler is what remotecommand expects from a pty.
type PtyHandler interface {
	io.Reader
	io.Writer
	remotecommand.TerminalSizeQueue
}

// Message is the messaging protocol between the shell and terminal session.
//
// OP      DIRECTION  FIELD(S) USED  DESCRIPTION
// ---------------------------------------------------------------------
// stdin   fe->be     Data           Keystrokes/paste buffer
// resize  fe->be     Rows, Cols     New terminal size
// stdout  be->fe     Data           Output from the process
type Message struct {
	Op, Data   string
	Rows, Cols uint16
}

// Session implements PtyHandler (using a WebSocket connection).
type Session struct {
	WebSocket *websocket.Conn
	SizeChan  chan remotecommand.TerminalSize
	DoneChan  chan struct{}
}

// Next is called in a loop from remotecommand as long as the process is
// running.
// TerminalSize handles pty->process resize events.
func (t Session) Next() *remotecommand.TerminalSize {
	select {
	case size := <-t.SizeChan:
		return &size
	case <-t.DoneChan:
		return nil
	}
}

// Read handles pty->process messages (stdin, resize).
// Called in a loop from remotecommand as long as the process is running.
func (t Session) Read(p []byte) (int, error) {
	_, m, err := t.WebSocket.ReadMessage()
	if err != nil {
		// Send terminated signal to process to avoid resource leak.
		return copy(p, END_OF_TRANSMISSION), err
	}

	var msg Message
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
func (t Session) Write(p []byte) (int, error) {
	msg, err := json.Marshal(Message{
		Op:   "stdout",
		Data: string(p),
	})
	if err != nil {
		return 0, err
	}

	if err = t.WebSocket.WriteMessage(websocket.TextMessage, msg); err != nil {
		return 0, err
	}
	return len(p), nil
}

// StartProcess executes the given command (cmd) in the container specified in
// the request and connects it up with the ptyHandler (a session).
func StartProcess(ctx context.Context, config *rest.Config, reqURL *url.URL, cmd []string, ptyHandler PtyHandler) error {
	exec, err := remotecommand.NewSPDYExecutor(config, "POST", reqURL)
	if err != nil {
		return err
	}

	err = exec.StreamWithContext(ctx, remotecommand.StreamOptions{
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

// IsValidShell checks if the user provided shell is an allowed one.
func IsValidShell(shell string) bool {
	for _, validShell := range []string{"bash", "sh", "pwsh", "cmd"} {
		if validShell == shell {
			return true
		}
	}
	return false
}
