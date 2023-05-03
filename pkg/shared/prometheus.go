package shared

import (
	"bytes"
	"context"
	"crypto/tls"
	"crypto/x509"
	"encoding/json"
	"fmt"
	"html/template"
	"math"
	"net"
	"net/http"
	"time"

	"github.com/kubenav/kubenav/pkg/server/portforwarding"

	"github.com/prometheus/client_golang/api"
	v1 "github.com/prometheus/client_golang/api/prometheus/v1"
	"github.com/prometheus/common/model"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

type request struct {
	Manifest   map[string]any `json:"manifest"`
	Prometheus prometheus     `json:"prometheus"`
	Queries    []query        `json:"queries"`
	TimeStart  int64          `json:"timeStart"`
	TimeEnd    int64          `json:"timeEnd"`
}

type prometheus struct {
	Address       string `json:"address"`
	Namespace     string `json:"namespace"`
	LabelSelector string `json:"labelSelector"`
	Container     string `json:"container"`
	Port          int64  `json:"port"`
	Path          string `json:"path"`
	Username      string `json:"username"`
	Password      string `json:"password"`
	Token         string `json:"token"`
	Certificate   string `json:"certificate"`
}

type query struct {
	Query string `json:"query"`
	Label string `json:"label"`
}

type metric struct {
	Label string  `json:"label"`
	Data  []datum `json:"data"`
}

type datum struct {
	X int64    `json:"x"`
	Y *float64 `json:"y"`
}

// PrometheusGetData can be used to run a list multiple PromQL queries against a Prometheus instance.
func PrometheusGetData(restConfig *rest.Config, clientset *kubernetes.Clientset, requestStr string) (string, error) {
	var requestData request
	err := json.Unmarshal([]byte(requestStr), &requestData)
	if err != nil {
		return "", err
	}

	// When not Prometheus address is specified, Prometheus is running inside the cluster and we have to establish a
	// port forwarding session to connect to the Prometheus API. The session is closed as soon as we retrieved the data
	// from the Prometheus API.
	if requestData.Prometheus.Address == "" {
		pf, err := getPortForwardingSesstion(restConfig, clientset, requestData)
		if err != nil {
			return "", err
		}

		defer func() {
			if session, ok := portforwarding.Sessions.Get(pf.ID); ok {
				close(session.StopCh)
				portforwarding.Sessions.Delete(pf.ID)
			}
		}()

		requestData.Prometheus.Address = fmt.Sprintf("http://localhost:%d%s", pf.LocalPort, requestData.Prometheus.Path)
	}

	// Create a Prometheus client with the user specified credentials. As address for the Prometheus instance we are
	// using localhost and the local port created in the port forwarding session.
	// We also need to set the range for the PromQL query from the start and end time specified in the reuqest data.
	roundTripper := getRoundTripper(requestData.Prometheus)

	if requestData.Prometheus.Username != "" && requestData.Prometheus.Password != "" {
		roundTripper = basicAuthTransport{
			Transport: roundTripper,
			username:  requestData.Prometheus.Username,
			password:  requestData.Prometheus.Password,
		}
	}

	if requestData.Prometheus.Token != "" {
		roundTripper = tokenAuthTransporter{
			Transport: roundTripper,
			token:     requestData.Prometheus.Token,
		}
	}

	client, err := api.NewClient(api.Config{
		Address:      requestData.Prometheus.Address,
		RoundTripper: roundTripper,
	})
	if err != nil {
		return "", err
	}

	v1api := v1.NewAPI(client)
	r := v1.Range{
		Start: time.Unix(requestData.TimeStart, 0),
		End:   time.Unix(requestData.TimeEnd, 0),
		Step:  time.Duration((requestData.TimeEnd-requestData.TimeStart)/100) * time.Second,
	}

	var metrics []metric

	// Loop through all query and interpolate them with the given manifest. This allows us to use for example the Pod
	// name or namespace within the PromQL queries. The interpolated queries are then sent to the Prometheus API.
	for _, q := range requestData.Queries {
		interpolatedQuery, err := queryInterpolation(q.Query, requestData.Manifest)
		if err != nil {
			return "", err
		}

		ctx := context.Background()
		result, _, err := v1api.QueryRange(ctx, interpolatedQuery, r)
		if err != nil {
			return "", err
		}

		// Here we have to loop though the returned streams to generate our metrics, which we can use in the Dart code
		// to render the charts.
		streams, ok := result.(model.Matrix)
		if !ok {
			return "", err
		}

		for _, stream := range streams {
			var data []datum
			for _, value := range stream.Values {
				timestamp := value.Timestamp.Unix() * 1000
				val := float64(value.Value)

				if math.IsNaN(val) || math.IsInf(val, 0) {
					data = append(data, datum{
						X: timestamp,
					})
				} else {
					data = append(data, datum{
						X: timestamp,
						Y: &val,
					})
				}
			}

			labels := make(map[string]any)

			for key, value := range stream.Metric {
				labels[string(key)] = string(value)
			}

			label, err := queryInterpolation(q.Label, labels)
			if err != nil {
				metrics = append(metrics, metric{
					Label: q.Label,
					Data:  data,
				})
			} else {
				if label == "" {
					label = stream.Metric.String()
				}

				metrics = append(metrics, metric{
					Label: label,
					Data:  data,
				})
			}
		}
	}

	metricsData, err := json.Marshal(metrics)
	if err != nil {
		return "", err
	}

	return string(metricsData), nil
}

func getPortForwardingSesstion(restConfig *rest.Config, clientset *kubernetes.Clientset, requestData request) (*portforwarding.Session, error) {
	// Get a list of all Pods, which are matching the users specified namespace and label selector. If the list of Pods
	// is empty we return an error. If not we continue with establishing the port forwarding session.
	cxt := context.Background()
	podList, err := clientset.CoreV1().Pods(requestData.Prometheus.Namespace).List(cxt, metav1.ListOptions{
		LabelSelector: requestData.Prometheus.LabelSelector,
	})
	if err != nil {
		return nil, err
	}

	if len(podList.Items) == 0 {
		return nil, fmt.Errorf("no pod found")
	}

	// Create a port forwarding session with the first Pod in the list of returned Pods from above. To establish the
	// portforwarding session we also use the user specified container and port.
	pf, err := portforwarding.CreateSession("plugin_prometheus_", podList.Items[0].Name, podList.Items[0].Namespace, requestData.Prometheus.Container, requestData.Prometheus.Port)
	if err != nil {
		return nil, err
	}

	errCh := make(chan error, 1)

	go func() {
		err := pf.Start(restConfig, fmt.Sprintf("/api/v1/namespaces/%s/pods/%s/portforward", podList.Items[0].Namespace, podList.Items[0].Name), requestData.Prometheus.Port)
		if err != nil {
			errCh <- err
		}
	}()

	select {
	case err := <-errCh:
		return nil, err
	case <-pf.ReadyCh:
		break
	}

	return pf, nil
}

func queryInterpolation(query string, manifest map[string]any) (string, error) {
	tpl, err := template.New("query").Parse(query)
	if err != nil {
		return "", err
	}

	var buf bytes.Buffer
	err = tpl.Execute(&buf, manifest)
	if err != nil {
		return "", err
	}

	return buf.String(), nil
}

func getRoundTripper(p prometheus) http.RoundTripper {
	tr := &http.Transport{
		Proxy: http.ProxyFromEnvironment,
		DialContext: (&net.Dialer{
			Timeout:   30 * time.Second,
			KeepAlive: 30 * time.Second,
		}).DialContext,
		TLSHandshakeTimeout: 10 * time.Second,
	}

	if p.Certificate != "" {
		certPool := x509.NewCertPool()
		certPool.AppendCertsFromPEM([]byte(p.Certificate))
		tr.TLSClientConfig = &tls.Config{
			RootCAs: certPool,
		}
	}

	return tr
}
