package streamlogs

import (
	"bufio"
	"context"
	"strings"

	"github.com/gorilla/websocket"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/client-go/kubernetes"
)

// StreamLogs opens a log stream for the provided container and writes the stream to the provided WebSocket connection.
func StreamLogs(ctx context.Context, clientset *kubernetes.Clientset, conn *websocket.Conn, namespace, name, container string, since int64) error {
	options := &corev1.PodLogOptions{
		Container:    container,
		SinceSeconds: &since,
		Follow:       true,
	}

	stream, err := clientset.CoreV1().Pods(namespace).GetLogs(name, options).Stream(ctx)
	if err != nil {
		return err
	}

	defer stream.Close()
	reader := bufio.NewReaderSize(stream, 16)
	lastLine := ""

	for {
		data, isPrefix, err := reader.ReadLine()
		if err != nil {
			return err
		}

		lines := strings.Split(string(data), "\r")
		length := len(lines)

		if len(lastLine) > 0 {
			lines[0] = lastLine + lines[0]
			lastLine = ""
		}

		if isPrefix {
			lastLine = lines[length-1]
			lines = lines[:(length - 1)]
		}

		for _, line := range lines {
			if err := conn.WriteMessage(websocket.TextMessage, []byte(line)); err != nil {
				return err
			}
		}
	}
}
