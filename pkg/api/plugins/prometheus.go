package plugins

import (
	"context"
	"fmt"
	"time"

	"github.com/prometheus/client_golang/api"
	v1 "github.com/prometheus/client_golang/api/prometheus/v1"
	"github.com/prometheus/common/model"
)

// PrometheusQuery is the structure of a single Prometheus query.
type PrometheusQuery struct {
	Label string `json:"label"`
	Query string `json:"query"`
}

// PrometheusData contains all queries and the start and end timestamp to run the Prometheus query
type PrometheusData struct {
	Queries []PrometheusQuery `json:"queries"`
	Start   int64             `json:"start"`
	End     int64             `json:"end"`
}

// PrometheusResult defines the structure for the Prometheus results containing the label and the values in the format
// [timestamp, value].
type PrometheusResult struct {
	Label  string             `json:"label"`
	Values []model.SamplePair `json:"values"`
}

// DoPrometheusAction runs queries against Prometheus and returns the timeseries data.
// As first we are converting the additional plugin data to the needed data for Prometheus. The we are initializing a
// new client for the Prometheus API. Last but not least we are sending each query to the Prometheus API and collecting
// the results in a slice of PrometheusResults.
func DoPrometheusAction(port int64, requestData map[string]interface{}) (interface{}, error) {
	var promData PrometheusData
	err := mapToStruct(requestData, &promData)
	if err != nil {
		return nil, err
	}

	client, err := api.NewClient(api.Config{
		Address: fmt.Sprintf("http://localhost:%d", port),
	})
	if err != nil {
		return nil, err
	}

	v1api := v1.NewAPI(client)
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	r := v1.Range{
		Start: time.Unix(promData.Start, 0),
		End:   time.Unix(promData.End, 0),
		Step:  time.Duration((promData.End-promData.Start)/100) * time.Second,
	}

	var res []PrometheusResult

	for _, query := range promData.Queries {
		result, err := v1api.QueryRange(ctx, query.Query, r)
		if err != nil {
			return nil, err
		}

		data, ok := result.(model.Matrix)
		if !ok {
			return nil, fmt.Errorf("unsupported result format: %s", result.Type().String())
		}

		for _, stream := range data {
			res = append(res, PrometheusResult{
				Label:  query.Label,
				Values: stream.Values,
			})
		}
	}

	return res, nil
}
