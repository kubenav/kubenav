package server

import (
	"encoding/json"
	"net/http"
	"testing"
)

func TestStartServer(t *testing.T) {
	go StartServer()

	client := &http.Client{}

	resp, err := client.Get("http://localhost:14122/api/test")
	if err != nil {
		t.Errorf("API request failed: %v", err)
	}

	if resp.StatusCode != http.StatusOK {
		t.Errorf("API returned unexpected status code: %d", resp.StatusCode)
	}

	if resp.Body == nil {
		t.Errorf("Response body is nil")
	}

	var data struct {
		Status string `json:"status"`
	}

	err = json.NewDecoder(resp.Body).Decode(&data)
	if err != nil {
		t.Errorf("Could not decode response")
	}

	if data.Status != "ok" {
		t.Errorf("Expected status=ok, but got status=%s", data.Status)
	}
}
