package elasticsearch

import (
	"bytes"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	log "github.com/sirupsen/logrus"
)

// Response ...
type Response struct {
	ScrollID string `json:"_scroll_id"`
	Took     int64  `json:"took"`
	TimedOut bool   `json:"timed_out"`
	Shards   struct {
		Total      int64 `json:"total"`
		Successful int64 `json:"successful"`
		Skipped    int64 `json:"skipped"`
		Failed     int64 `json:"failed"`
	} `json:"_shards"`
	Hits struct {
		Total struct {
			Value    int64  `json:"value"`
			Relation string `json:"relation"`
		} `json:"total"`
		Hits []map[string]interface{} `json:"hits"`
	} `json:"hits"`
}

// ResponseError ...
type ResponseError struct {
	Error struct {
		RootCause []struct {
			Type   string `json:"type"`
			Reason string `json:"reason"`
		} `json:"root_cause"`
		Type     string `json:"type"`
		Reason   string `json:"reason"`
		CausedBy struct {
			Type   string `json:"type"`
			Reason string `json:"reason"`
		} `json:"caused_by"`
	} `json:"error"`
	Status int `json:"status"`
}

// RunQuery executes a given query for Elasticsearch.
func RunQuery(address string, timeout time.Duration, requestData map[string]interface{}) (interface{}, error) {
	client := &http.Client{
		Timeout: timeout,
	}

	query := requestData["query"].(map[string]interface{})
	username := requestData["username"].(string)
	password := requestData["password"].(string)
	scrollID := requestData["scrollID"].(string)

	var err error
	var body []byte
	var url string

	if scrollID == "" {
		url = fmt.Sprintf("%s/_search?scroll=5m", address)
		body, err = json.Marshal(query)
		if err != nil {
			return nil, err
		}
	} else {
		url = fmt.Sprintf("%s/_search/scroll", address)
		body = []byte(`{"scroll" : "5m", "scroll_id" : "` + scrollID + `"}`)
	}

	log.WithFields(log.Fields{"body": string(body), "url": url}).Debugf("Received Elasticsearch request")

	req, err := http.NewRequest(http.MethodPost, url, bytes.NewBuffer(body))
	if err != nil {
		return nil, err
	}

	req.Header.Add("Content-Type", "application/json")

	if username != "" && password != "" {
		req.Header.Add("Authorization", "Basic "+base64.StdEncoding.EncodeToString([]byte(username+":"+password)))
	}

	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}

	if resp.StatusCode >= 200 && resp.StatusCode < 300 {
		var res Response

		err = json.NewDecoder(resp.Body).Decode(&res)
		if err != nil {
			return nil, err
		}

		log.WithFields(log.Fields{"took": res.Took, "hits": res.Hits.Total.Value}).Debugf("Run query")

		return res, nil
	}

	var res ResponseError

	err = json.NewDecoder(resp.Body).Decode(&res)
	if err != nil {
		return nil, err
	}

	log.WithFields(log.Fields{"type": res.Error.Type, "reason": res.Error.Reason}).Error("The query returned an error")

	return nil, fmt.Errorf("%s: %s", res.Error.Type, res.Error.Reason)
}
