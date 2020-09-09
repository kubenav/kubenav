package terminal

import (
	"net/http"

	"golang.org/x/crypto/ssh"
	"gopkg.in/igm/sockjs-go.v2/sockjs"
)

// SSHRequest defines the structure to init a new SSH session.
type SSHRequest struct {
	Key     string `json:"key"`
	Address string `json:"address"`
	User    string `json:"user"`
}

// CreateSSHHandler is called from main for /api/kubernetes/exec/sockjs
func CreateSSHHandler(path string) http.Handler {
	return sockjs.NewHandler(path, sockjs.DefaultOptions, handleTerminalSession)
}

// startSSHProcess is called by sshHandler
// Executed cmd in the container specified in request and connects it up with the ptyHandler (a session)
func startSSHProcess(key, addr, user string, ptyHandler PtyHandler) error {
	signer, err := ssh.ParsePrivateKey([]byte(key))
	if err != nil {
		return err
	}

	sshConfig := &ssh.ClientConfig{
		User: user,
		Auth: []ssh.AuthMethod{
			ssh.PublicKeys(signer),
		},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(),
	}

	client, err := ssh.Dial("tcp", addr, sshConfig)
	if err != nil {
		return err
	}
	defer client.Close()

	session, err := client.NewSession()
	if err != nil {
		return err
	}
	defer session.Close()

	if err := session.RequestPty("xterm", 40, 80, ssh.TerminalModes{
		ssh.ECHO:          1,
		ssh.TTY_OP_ISPEED: 14400,
		ssh.TTY_OP_OSPEED: 14400,
	}); err != nil {
		return err
	}

	session.Stdin = ptyHandler
	session.Stdout = ptyHandler
	session.Stderr = ptyHandler

	sizeChan := ptyHandler.GetSizeChan()

	go func() {
		for {
			select {
			case size := <-sizeChan:
				session.WindowChange(int(size.Height), int(size.Width))
			}
		}
	}()

	err = session.Shell()
	if err != nil {
		return err
	}

	if err := session.Wait(); err != nil {
		return err
	}

	return nil
}

// WaitForSSH is called from execHandler as a goroutine
// Waits for the SockJS connection to be opened by the client the session to be bound in handleSSHSession
func WaitForSSH(key, addr, user string, sessionID string) {
	select {
	case <-TerminalSessions.Get(sessionID).Bound:
		close(TerminalSessions.Get(sessionID).Bound)

		err := startSSHProcess(key, addr, user, TerminalSessions.Get(sessionID))
		if err != nil {
			TerminalSessions.Close(sessionID, 2, err.Error())
			return
		}

		TerminalSessions.Close(sessionID, 1, "Process exited")
	}
}
