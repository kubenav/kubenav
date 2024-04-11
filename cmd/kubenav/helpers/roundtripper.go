package helpers

import (
	"net/http"
)

type BasicAuthTransport struct {
	Transport http.RoundTripper

	Username string
	Password string
}

type TokenAuthTransporter struct {
	Transport http.RoundTripper

	Token string
}

func (bat BasicAuthTransport) RoundTrip(req *http.Request) (*http.Response, error) {
	req.SetBasicAuth(bat.Username, bat.Password)
	return bat.Transport.RoundTrip(req)
}

func (tat TokenAuthTransporter) RoundTrip(req *http.Request) (*http.Response, error) {
	req.Header.Set("Authorization", "Bearer "+tat.Token)
	return tat.Transport.RoundTrip(req)
}
