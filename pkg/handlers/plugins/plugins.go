// Package plugins can be used to extend kubenav with specific actions for an third party application. Each plugin opens
// a new port forwarding session to a specified pod. This session is closed when the plugin action is finished.
// For example: We open a port to an deployed Prometheus instance in the cluster, run queries against the Prometheus
// API, return the query results and last but not least we are closing the port forwarding session.
package plugins

import (
	"fmt"
	"time"

	"github.com/kubenav/kubenav/pkg/handlers/plugins/elasticsearch"
	"github.com/kubenav/kubenav/pkg/handlers/plugins/prometheus"
	"github.com/kubenav/kubenav/pkg/handlers/portforwarding"
	"github.com/kubenav/kubenav/pkg/kube"

	log "github.com/sirupsen/logrus"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

// Config is the structure of the configuration which can be set via flags for the server implementation of kubenav. For
// example we do not want to use port forwarding for the Prometheus plugin, instead we want to use the cluster URL of
// Prometheus.
type Config struct {
	Prometheus    *prometheus.Config    `json:"prometheus"`
	Elasticsearch *elasticsearch.Config `json:"elasticsearch"`
}

// Request is the structure of a request for a plugin.
type Request struct {
	kube.Request
	PortforwardingPath string                 `json:"portforwardingPath"`
	Name               string                 `json:"name"`
	Port               int64                  `json:"port"`
	Address            string                 `json:"address"`
	Data               map[string]interface{} `json:"data"`
}

// Run execute the specified plugin. For each request a new port forwarding session to the Pod for the plugin is opened.
// This session is closed when the function returns a result or an error.
// After the port forwarding session we have to wait 5 seconds, to make sure the the port forwarding session is ready to
// use.
// When the address value isn't empty we asume that kubenav is running inside a Kubernetes cluster and using this
// address instead of port forwarding.
func Run(request Request, config *rest.Config, clientset *kubernetes.Clientset, timeout time.Duration, pluginConfig *Config) (interface{}, error) {
	var err error
	var result interface{}

	if request.Address == "" {
		pf, err := portforwarding.CreateSession("plugins_", "Unknow", "Unknow", request.Port, 0, config)
		if err != nil {
			return nil, err
		}

		defer func(sessionID string) {
			if session, ok := portforwarding.Sessions.Get(sessionID); ok {
				close(session.StopCh)
				portforwarding.Sessions.Delete(session.ID)
			}
		}(pf.ID)

		errCh := make(chan error, 1)

		go func() {
			err := pf.Start(request.PortforwardingPath)
			if err != nil {
				errCh <- err
			}
		}()

		select {
		case err := <-errCh:
			log.WithError(err).Error("Could not establish port forwarding connection")
			return nil, fmt.Errorf("Could not establish port forwarding connection: %s", err.Error())
		case <-pf.ReadyCh:
			log.Debug("Port forwarding is ready")
			break
		}

		request.Address = fmt.Sprintf("http://localhost:%d", pf.LocalPort)
	}

	switch request.Name {
	case "prometheus":
		if pluginConfig == nil {
			result, err = prometheus.RunQueries(nil, request.Address, timeout, request.Data)
		} else {
			result, err = prometheus.RunQueries(pluginConfig.Prometheus, request.Address, timeout, request.Data)
		}
	case "elasticsearch":
		if pluginConfig == nil {
			result, err = elasticsearch.RunQuery(nil, request.Address, timeout, request.Data)
		} else {
			result, err = elasticsearch.RunQuery(pluginConfig.Elasticsearch, request.Address, timeout, request.Data)
		}
	}

	return result, err
}
