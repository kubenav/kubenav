package api

import (
	"fmt"
	"io"
	"net/http"
	"strings"

	"k8s.io/client-go/kubernetes"
)

// LogSession is the structure of a log session, which consists of an unique id and a Kubernetes clientset.
type LogSession struct {
	ClientSet *kubernetes.Clientset
	URL       string
}

// LogSessions holds all open log sessions.
var LogSessions = make(map[string]LogSession)

// StreamLogsHandler handles the requests to stream the logs of a container.
func StreamLogsHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Connection", "keep-alive")
	w.Header().Set("Content-Type", "text/event-stream")
	w.Header().Set("Access-Control-Allow-Origin", "*")

	params := strings.Split(r.URL.Path, "/")
	sessionID := params[len(params)-1]
	logSession, ok := LogSessions[sessionID]
	if !ok {
		return
	}

	readCloser, err := logSession.ClientSet.RESTClient().Get().RequestURI(logSession.URL).Stream()
	if err != nil {
		delete(LogSessions, sessionID)
		return
	}
	defer readCloser.Close()

	for {
		select {
		case <-r.Context().Done():
			delete(LogSessions, sessionID)
			return
		default:
			p := make([]byte, 2048)
			n, err := readCloser.Read(p)
			if err != nil {
				delete(LogSessions, sessionID)

				if err == io.EOF {
					return
				}

				return
			}

			if string(p[:n]) != "" {
				w.Write([]byte(fmt.Sprintf("data: %s\n\n", string(p[:n]))))
				w.(http.Flusher).Flush()
			}
		}
	}
}
