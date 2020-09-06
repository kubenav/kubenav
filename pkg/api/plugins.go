package api

import (
	"time"

	"github.com/kubenav/kubenav/pkg/api/plugins"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

// PluginRequest is the structure of a request for a plugin
type PluginRequest struct {
	Request
	Name string                 `json:"name"`
	Port int64                  `json:"port"`
	Data map[string]interface{} `json:"data"`
}

// DoPluginAction runs the plugin action. For each request a new port forwarding session to the Pod for the plugin is
// opend. This session is closed when the function returns a result or an error.
func DoPluginAction(config *rest.Config, clientset *kubernetes.Clientset, name, pod string, port int64, data map[string]interface{}) (interface{}, error) {
	pf, err := NewPortForwarding(config, "plugins_", pod, "Unknow", "Unknow", port, 0)
	if err != nil {
		return nil, err
	}

	defer func() {
		if _, ok := PortForwardSessions[pf.ID]; ok {
			PortForwardSessions[pf.ID].Stop()
		}
	}()

	go pf.Start()
	time.Sleep(5 * time.Second)

	var result interface{}

	switch name {
	case "prometheus":
		result, err = plugins.DoPrometheusAction(pf.LocalPort, data)
	}

	return result, err
}
