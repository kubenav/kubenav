package api

import (
	"fmt"
	"io"
	"net/http"
	"strings"

	"github.com/kubenav/kubenav/pkg/api/middleware"

	"k8s.io/client-go/kubernetes"
)

type LogSession struct {
	ClientSet *kubernetes.Clientset
	URL       string
}

var LogSessions = make(map[string]LogSession)

// StreamLogsHandler handles the requests to stream the logs of a container.
func StreamLogsHandler(w http.ResponseWriter, r *http.Request) {
	params := strings.Split(r.URL.Path, "/")
	logSession, ok := LogSessions[params[len(params)-1]]
	if !ok {
		middleware.Errorf(w, r, nil, http.StatusInternalServerError, fmt.Sprintf("Invalid session id"))
		return
	}

	readCloser, err := logSession.ClientSet.RESTClient().Get().RequestURI(logSession.URL).Stream()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not stream logs: %s", err.Error()))
		return
	}
	defer readCloser.Close()

	w.Header().Set("Connection", "keep-alive")
	w.Header().Set("Content-Type", "text/event-stream")
	w.Header().Set("Access-Control-Allow-Origin", "*")

	for {
		select {
		case <-r.Context().Done():
			middleware.Write(w, r, nil)
			return
		default:
			p := make([]byte, 2048)
			n, err := readCloser.Read(p)
			if err != nil {
				if err == io.EOF {
					middleware.Write(w, r, nil)
					return
				}

				middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not stream logs: %s", err.Error()))
				return
			}

			if string(p[:n]) != "" {
				w.Write([]byte(fmt.Sprintf("data: %s\n\n", string(p[:n]))))
				w.(http.Flusher).Flush()
			}
		}
	}
}
