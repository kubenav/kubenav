package plugins

import (
	"time"

	"github.com/kubenav/kubenav/pkg/handlers/portforwarding"
	"github.com/kubenav/kubenav/pkg/kube"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

// Request is the structure of a request for a plugin
type Request struct {
	kube.Request
	Name string                 `json:"name"`
	Port int64                  `json:"port"`
	Data map[string]interface{} `json:"data"`
}

// DoPluginAction runs the plugin action. For each request a new port forwarding session to the Pod for the plugin is
// opend. This session is closed when the function returns a result or an error.
func DoPluginAction(config *rest.Config, clientset *kubernetes.Clientset, name, pod string, port int64, data map[string]interface{}) (interface{}, error) {
	pf, err := portforwarding.NewPortForwarding(config, "plugins_", pod, "Unknow", "Unknow", port, 0)
	if err != nil {
		return nil, err
	}

	defer func(sessionID string) {
		portforwarding.Sessions.Get(sessionID).Stop()
	}(pf.ID)

	go pf.Start()
	time.Sleep(5 * time.Second)

	var result interface{}

	switch name {
	case "prometheus":
		result, err = DoPrometheusAction(pf.LocalPort, data)
	}

	return result, err
}
