package shared

import (
	"net/http"
)

type basicAuthTransport struct {
	Transport http.RoundTripper

	username string
	password string
}

type tokenAuthTransporter struct {
	Transport http.RoundTripper

	token string
}

func (bat basicAuthTransport) RoundTrip(req *http.Request) (*http.Response, error) {
	req.SetBasicAuth(bat.username, bat.password)
	return bat.Transport.RoundTrip(req)
}

func (tat tokenAuthTransporter) RoundTrip(req *http.Request) (*http.Response, error) {
	req.Header.Set("Authorization", "Bearer "+tat.token)
	return tat.Transport.RoundTrip(req)
}
