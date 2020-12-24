package jaeger

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/kubenav/kubenav/pkg/handlers/plugins/helpers"

	log "github.com/sirupsen/logrus"
)

// Config contains the required Jaeger configuration for the web version of kubenav.
type Config struct {
	Enabled  bool   `json:"enabled"`
	Address  string `json:"address"`
	Username string `json:"-"`
	Password string `json:"-"`
}

// Request is the required data to query for traces from Jaeger.
type Request struct {
	Type string `json:"type"`

	End         string `json:"end"`
	Limit       string `json:"limit"`
	Lookback    string `json:"lookback"`
	MaxDuration string `json:"maxDuration"`
	MinDuration string `json:"minDuration"`
	Operation   string `json:"operation"`
	Service     string `json:"service"`
	Start       string `json:"start"`
	Tags        string `json:"tags"`

	Trace string `json:"trace"`

	Username      string `json:"username"`
	Password      string `json:"password"`
	QueryBasePath string `json:"queryBasePath"`
}

// ResponseError ...
type ResponseError struct {
	Errors []struct {
		Code int    `json:"code"`
		Msg  string `json:"msg"`
	} `json:"errors"`
}

// ResponseOperations ...
type ResponseOperations struct {
	Services   []interface{} `json:"services"`
	Operations []interface{} `json:"operations"`
}

// RunQuery executes a given query for Jaeger.
func RunQuery(config *Config, address string, timeout time.Duration, requestData map[string]interface{}) (interface{}, error) {
	var request Request
	err := helpers.MapToStruct(requestData, &request)
	if err != nil {
		return nil, err
	}

	if config != nil {
		request.Username = config.Username
	}

	if config != nil {
		request.Password = config.Password
	}

	address = address + request.QueryBasePath

	if request.Type == "traces" {
		if request.Lookback != "custom" {
			duration, err := time.ParseDuration(request.Lookback)
			if err != nil {
				return nil, err
			}

			request.End = fmt.Sprintf("%d000000", time.Now().Unix())
			request.Start = fmt.Sprintf("%d000000", time.Now().Add(-1*duration).Unix())
		}

		url := fmt.Sprintf("%s/api/traces?end=%s&limit=%s&lookback=%s&maxDuration=%s&minDuration=%s&operation=%s&service=%s&start=%s", address, request.End, request.Limit, request.Lookback, request.MaxDuration, request.MinDuration, request.Operation, request.Service, request.Start)
		if request.Tags != "" {
			url = url + "tags=" + request.Tags
		}

		log.WithFields(log.Fields{"url": url}).Debugf("Query url for traces")

		var traces map[string]interface{}
		err = doRequest(url, request.Username, request.Password, timeout, &traces)
		if err != nil {
			return nil, err
		}

		return traces, nil
	}

	if request.Type == "trace" {
		log.WithFields(log.Fields{"trace": request.Trace}).Debugf("Get trace")

		var trace map[string]interface{}
		err = doRequest(fmt.Sprintf("%s/api/traces/%s", address, request.Trace), request.Username, request.Password, timeout, &trace)
		if err != nil {
			return nil, err
		}

		return trace, nil
	}

	if request.Type == "operations" {
		log.WithFields(log.Fields{"service": request.Service}).Debugf("Get services and operations")

		var services map[string]interface{}
		err = doRequest(fmt.Sprintf("%s/api/services", address), request.Username, request.Password, timeout, &services)
		if err != nil {
			return nil, err
		}

		if request.Service == "" {
			servicesSlice := services["data"].([]interface{})
			if len(servicesSlice) > 0 {
				request.Service = servicesSlice[0].(string)
			} else {
				return nil, nil
			}
		}

		var operations map[string]interface{}
		err = doRequest(fmt.Sprintf("%s/api/operations?service=%s", address, request.Service), request.Username, request.Password, timeout, &operations)
		if err != nil {
			return nil, err
		}

		return ResponseOperations{
			Services:   services["data"].([]interface{}),
			Operations: operations["data"].([]interface{}),
		}, nil
	}

	return nil, fmt.Errorf("Invalide request type")
}

func doRequest(url, username, password string, timeout time.Duration, result *map[string]interface{}) error {
	client := &http.Client{
		Timeout: timeout,
	}

	req, err := http.NewRequest(http.MethodGet, url, nil)
	if err != nil {
		return err
	}

	if username != "" && password != "" {
		req.Header.Add("Authorization", "Basic "+base64.StdEncoding.EncodeToString([]byte(username+":"+password)))
	}

	resp, err := client.Do(req)
	if err != nil {
		return err
	}

	defer resp.Body.Close()

	if resp.StatusCode >= 200 && resp.StatusCode < 300 {
		err = json.NewDecoder(resp.Body).Decode(&result)
		if err != nil {
			return err
		}

		return nil
	}

	var res ResponseError

	err = json.NewDecoder(resp.Body).Decode(&res)
	if err != nil {
		return err
	}

	if len(res.Errors) > 0 {
		return fmt.Errorf(res.Errors[0].Msg)
	}

	return fmt.Errorf("%v", res)
}
