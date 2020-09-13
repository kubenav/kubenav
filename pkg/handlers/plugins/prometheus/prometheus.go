package prometheus

import (
	"context"
	"sort"
	"sync"
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

// ChartSize is the structure for the size of a chart, which is needed to render the chart later.
type ChartSize struct {
	Xs string `json:"xs"`
	Sm string `json:"sm"`
	Md string `json:"md"`
	Lg string `json:"lg"`
	Xl string `json:"xl"`
}

// Chart is the structure of a single chart which is send to the plugin within the plugin data. The chart contains some
// meta data to render the chart later and the queries.
type Chart struct {
	Index   int       `json:"-"`
	Title   string    `json:"title"`
	Size    ChartSize `json:"size"`
	Type    string    `json:"type"`
	Queries []Query   `json:"queries"`
}

// Data contains all queries and the start and end timestamp for the specified Prometheus queries.
type Data struct {
	Charts []Chart `json:"charts"`
	Start  int64   `json:"start"`
	End    int64   `json:"end"`
}

// Result defines the structure for the Prometheus results containing the label and the values in the format
// [timestamp, value].
type Result struct {
	Label  string             `json:"label"`
	Values []model.SamplePair `json:"values"`
}

// ChartsResult is the structure of the response, which contains the chart meta data and the Prometheus query results.
type ChartsResult struct {
	Index   int       `json:"-"`
	Title   string    `json:"title"`
	Size    ChartSize `json:"size"`
	Type    string    `json:"type"`
	Results []Result  `json:"results"`
}

// RunQueries runs queries against Prometheus and returns the timeseries data.
// As first we are converting the additional plugin data to the needed data for Prometheus. The we are initializing a
// new client for the Prometheus API. Last but not least we are sending each query to the Prometheus API and collecting
// the results in a slice of Results.
func RunQueries(address string, timeout time.Duration, requestData map[string]interface{}) (interface{}, error) {
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
	ctx, cancel := context.WithTimeout(context.Background(), timeout)
	defer cancel()
	r := v1.Range{
		Start: time.Unix(promData.Start, 0),
		End:   time.Unix(promData.End, 0),
		Step:  time.Duration((promData.End-promData.Start)/100) * time.Second,
	}

	var chartsResult []ChartsResult
	var waitgroup sync.WaitGroup

	for index, chart := range promData.Charts {
		chart.Index = index
		waitgroup.Add(1)

		go func(chart Chart) {
			defer waitgroup.Done()

			var results []Result

			for _, query := range chart.Queries {
				result, err := v1api.QueryRange(ctx, query.Query, r)
				if err != nil {
					chartsResult = append(chartsResult, ChartsResult{
						Title:   chart.Title,
						Size:    chart.Size,
						Type:    chart.Type,
						Results: nil,
					})

					return
				}

				data, ok := result.(model.Matrix)
				if !ok {
					chartsResult = append(chartsResult, ChartsResult{
						Title:   chart.Title,
						Size:    chart.Size,
						Type:    chart.Type,
						Results: nil,
					})

					return
				}

				for _, stream := range data {
					results = append(results, Result{
						Label:  query.Label,
						Values: stream.Values,
					})
				}
			}

			chartsResult = append(chartsResult, ChartsResult{
				Index:   chart.Index,
				Title:   chart.Title,
				Size:    chart.Size,
				Type:    chart.Type,
				Results: results,
			})
		}(chart)
	}

	waitgroup.Wait()

	// Since we are using a waitgroup to parallize the processing of the charts, we have to sort the results after we
	// are done. For this we are using the added index field, to ensure the user always sees the charts in the same
	// order.
	sort.Slice(chartsResult, func(i, j int) bool {
		return chartsResult[i].Index < chartsResult[j].Index
	})

	return chartsResult, nil
}
