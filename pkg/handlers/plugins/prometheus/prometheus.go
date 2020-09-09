package prometheus

import (
	"context"
	"fmt"
	"time"

	"github.com/kubenav/kubenav/pkg/handlers/plugins/helpers"

	"github.com/prometheus/client_golang/api"
	v1 "github.com/prometheus/client_golang/api/prometheus/v1"
	"github.com/prometheus/common/model"
)

// Query is the structure of a single Prometheus query.
type Query struct {
	Label string `json:"label"`
	Query string `json:"query"`
}

// Data contains all queries and the start and end timestamp for the specified Prometheus queries.
type Data struct {
	Queries []Query `json:"queries"`
	Start   int64   `json:"start"`
	End     int64   `json:"end"`
}

// Result defines the structure for the Prometheus results containing the label and the values in the format
// [timestamp, value].
type Result struct {
	Label  string             `json:"label"`
	Values []model.SamplePair `json:"values"`
}

// RunQueries runs queries against Prometheus and returns the timeseries data.
// As first we are converting the additional plugin data to the needed data for Prometheus. The we are initializing a
// new client for the Prometheus API. Last but not least we are sending each query to the Prometheus API and collecting
// the results in a slice of Results.
func RunQueries(address string, requestData map[string]interface{}) (interface{}, error) {
	var promData Data
	err := helpers.MapToStruct(requestData, &promData)
	if err != nil {
		return nil, err
	}

	client, err := api.NewClient(api.Config{
		Address: address,
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

	var results []Result

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
			results = append(results, Result{
				Label:  query.Label,
				Values: stream.Values,
			})
		}
	}

	return results, nil
}
