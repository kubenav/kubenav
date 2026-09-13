package kube

import (
	"context"
	"encoding/base64"
	"encoding/pem"
	"net/http/httptest"
	"testing"
)

func TestNewClientTLSServerName(t *testing.T) {
	restConfig, _, err := NewClient(
		"https://api.example.test:6443",
		"kubernetes.default.svc",
		"",
		false,
		"",
		"",
		"",
		"",
		"",
		"",
		0,
	)
	if err != nil {
		t.Fatalf("NewClient() returned an error: %v", err)
	}

	if restConfig.ServerName != "kubernetes.default.svc" {
		t.Fatalf(
			"NewClient() TLS server name = %q, want %q",
			restConfig.ServerName,
			"kubernetes.default.svc",
		)
	}
}

func TestNewClientEmptyTLSServerName(t *testing.T) {
	restConfig, _, err := NewClient(
		"https://api.example.test:6443",
		"",
		"",
		false,
		"",
		"",
		"",
		"",
		"",
		"",
		0,
	)
	if err != nil {
		t.Fatalf("NewClient() returned an error: %v", err)
	}

	if restConfig.ServerName != "" {
		t.Fatalf(
			"NewClient() TLS server name = %q, want an empty value",
			restConfig.ServerName,
		)
	}
}

func TestNewClientTLSServerNameWithProxyAndCA(t *testing.T) {
	tlsServer := httptest.NewTLSServer(nil)
	defer tlsServer.Close()

	caData := base64.StdEncoding.EncodeToString(pem.EncodeToMemory(&pem.Block{
		Type:  "CERTIFICATE",
		Bytes: tlsServer.Certificate().Raw,
	}))

	restConfig, _, err := NewClient(
		"https://api.example.test:6443",
		"kubernetes.default.svc",
		caData,
		false,
		"",
		"",
		"",
		"",
		"",
		"http://proxy.example.test:8080",
		0,
	)
	if err != nil {
		t.Fatalf("NewClient() returned an error: %v", err)
	}

	if restConfig.ServerName != "kubernetes.default.svc" {
		t.Fatalf(
			"NewClient() TLS server name = %q, want %q",
			restConfig.ServerName,
			"kubernetes.default.svc",
		)
	}
	if len(restConfig.CAData) == 0 {
		t.Fatal("NewClient() dropped the certificate authority data")
	}
	if restConfig.Transport != nil {
		t.Fatal("NewClient() replaced the client-go TLS transport")
	}
	if restConfig.Proxy == nil {
		t.Fatal("NewClient() did not configure the proxy")
	}

	proxyURL, err := restConfig.Proxy(
		httptest.NewRequestWithContext(
			context.Background(),
			"GET",
			"https://api.example.test:6443/readyz",
			nil,
		),
	)
	if err != nil {
		t.Fatalf("configured proxy returned an error: %v", err)
	}
	if proxyURL.String() != "http://proxy.example.test:8080" {
		t.Fatalf(
			"configured proxy = %q, want %q",
			proxyURL.String(),
			"http://proxy.example.test:8080",
		)
	}
}
