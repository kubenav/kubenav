// Package plugins can be used to extend kubenav with specific actions for an third party application. Each plugin opens
// a new port forwarding session to a specified pod. This session is closed when the plugin action is finished.
// For example: We open a port to an deployed Prometheus instance in the cluster, run queries against the Prometheus
// API, return the query results and last but not least we are closing the port forwarding session.
package plugins

import (
	"fmt"
	"time"

	"github.com/kubenav/kubenav/pkg/handlers/plugins/prometheus"
	"github.com/kubenav/kubenav/pkg/handlers/portforwarding"
	"github.com/kubenav/kubenav/pkg/kube"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

// Config is the structure of the configuration which can be set via flags for the server implementation of kubenav. For
// example we do not want to use port forwarding for the Prometheus plugin, instead we want to use the cluster URL of
// Prometheus.
type Config struct {
	PrometheusEnabled bool   `json:"prometheusEnabled"`
	PrometheusAddress string `json:"prometheusAddress"`
}

// Request is the structure of a request for a plugin.
type Request struct {
	kube.Request
	Name    string                 `json:"name"`
	Port    int64                  `json:"port"`
	Address string                 `json:"address"`
	Data    map[string]interface{} `json:"data"`
}

// Run execute the specified plugin. For each request a new port forwarding session to the Pod for the plugin is opened.
// This session is closed when the function returns a result or an error.
// After the port forwarding session we have to wait 5 seconds, to make sure the the port forwarding session is ready to
// use.
// When the address value isn't empty we asume that kubenav is running inside a Kubernetes cluster and using this
// address instead of port forwarding.
func Run(config *rest.Config, clientset *kubernetes.Clientset, name, podURL string, port int64, address string, timeout time.Duration, data map[string]interface{}) (interface{}, error) {
	var err error
	var result interface{}

	if address == "" {
		pf, err := portforwarding.NewPortForwarding(config, "plugins_", podURL, "Unknow", "Unknow", port, 0)
		if err != nil {
			return nil, err
		}

		defer func(sessionID string) {
			portforwarding.Sessions.Get(sessionID).Stop()
		}(pf.ID)

		go pf.Start()
		time.Sleep(5 * time.Second)

		address = fmt.Sprintf("http://localhost:%d", pf.LocalPort)
	}

	switch name {
	case "prometheus":
		result, err = prometheus.RunQueries(address, timeout, data)
	}

	return result, err
}
