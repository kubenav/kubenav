package api

import (
	"bytes"
	"crypto/tls"
	"crypto/x509"
	"encoding/json"
	"fmt"
	"github.com/kubenav/kubenav/pkg/api/middleware"
	"io/ioutil"
	"net/http"
	"strings"
	"time"
)

type APIRequest struct {
	Cluster                  string `json:"cluster"`
	Method                   string `json:"method"`
	URL                      string `json:"url"`
	Body                     string `json:"body"`
	CertificateAuthorityData string `json:"certificateAuthorityData"`
	ClientCertificateData    string `json:"clientCertificateData"`
	ClientKeyData            string `json:"clientKeyData"`
	Token                    string `json:"token"`
	Username                 string `json:"username"`
	Password                 string `json:"password"`
	InsecureSkipTLSVerify    bool   `json:"insecureSkipTLSVerify"`
	Timeout                  int64  `json:"timeout"`
}

type APIResponse struct {
	Data string `json:"data"`
}

type APIError struct {
	Kind       string `json:"kind"`
	APIVersion string `json:"apiVersion"`
	Status     string `json:"status"`
	Message    string `json:"message"`
	Reason     string `json:"reason"`
	Code       int    `json:"code"`
}

func requestHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var tlsConfig *tls.Config
	var err error

	var request APIRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err = json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	tlsConfig, err = httpClientForRootCAs(request.CertificateAuthorityData, request.ClientCertificateData, request.ClientKeyData, request.InsecureSkipTLSVerify)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, http.StatusText(http.StatusInternalServerError))
		return
	}

	client := &http.Client{
		Timeout: time.Duration(request.Timeout) * time.Second,
		Transport: &http.Transport{
			TLSClientConfig: tlsConfig,
			Proxy:           http.ProxyFromEnvironment,
		},
	}

	req, err := http.NewRequest(request.Method, request.URL, bytes.NewBuffer([]byte(request.Body)))
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not create Kubernetes API request")
		return
	}

	req.Header.Set("Accept", "application/json")

	if request.Method == "PATCH" {
		req.Header.Set("Content-Type", "application/json-patch+json")
	} else {
		req.Header.Set("Content-Type", "application/json")
	}

	if request.Token != "" {
		req.Header.Set("Authorization", "Bearer "+request.Token)
	}

	if request.Username != "" && request.Password != "" {
		req.SetBasicAuth(request.Username, request.Password)
	}

	resp, err := client.Do(req)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed: %s", err.Error()))
		return
	}

	defer resp.Body.Close()

	if !(resp.StatusCode >= 200 && resp.StatusCode < 300) {
		var apiError APIError
		err := json.NewDecoder(resp.Body).Decode(&apiError)
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Kubernetes API request failed with status code %d", resp.StatusCode))
			return
		}

		middleware.Errorf(w, r, nil, resp.StatusCode, fmt.Sprintf("Kubernetes API request failed: %s", apiError.Message))
		return
	}

	respBody, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not read response body")
		return
	}

	apiResponse := APIResponse{
		Data: strings.TrimSuffix(string(respBody), "\n"),
	}

	middleware.Write(w, r, apiResponse)
	return
}

// httpClientForRootCAs return an HTTP client which trusts the provided root CAs.
func httpClientForRootCAs(certificateAuthorityData, clientCertificateData, clientKeyData string, insecureSkipTLSVerify bool) (*tls.Config, error) {
	tlsConfig := tls.Config{}

	if certificateAuthorityData != "" {
		tlsConfig = tls.Config{RootCAs: x509.NewCertPool()}
		rootCA := []byte(certificateAuthorityData)

		if !tlsConfig.RootCAs.AppendCertsFromPEM(rootCA) {
			return nil, fmt.Errorf("no certs found in root CA file")
		}
	}

	if clientCertificateData != "" && clientKeyData != "" {
		cert, err := tls.X509KeyPair([]byte(clientCertificateData), []byte(clientKeyData))
		if err != nil {
			return nil, err
		}

		tlsConfig.Certificates = []tls.Certificate{cert}
	}

	tlsConfig.InsecureSkipVerify = insecureSkipTLSVerify

	return &tlsConfig, nil
}
