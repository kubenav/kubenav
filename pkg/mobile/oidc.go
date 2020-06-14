package mobile

import (
	"context"
	"crypto/tls"
	"crypto/x509"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"

	"github.com/coreos/go-oidc"
	"golang.org/x/oauth2"
)

// OIDCRequest is the structure of a request for one of the OIDC methods.
type OIDCRequest struct {
	DiscoveryURL         string `json:"discoveryURL"`
	ClientID             string `json:"clientID"`
	ClientSecret         string `json:"clientSecret"`
	CertificateAuthority string `json:"certificateAuthority"`
	RedirectURL          string `json:"redirectURL"`
	RefreshToken         string `json:"refreshToken"`
	Code                 string `json:"code"`
}

// OIDCResponse is the structure of a response for one of the OIDC methods.
type OIDCResponse struct {
	URL          string `json:"url"`
	IDToken      string `json:"id_token"`
	RefreshToken string `json:"refresh_token"`
	AccessToken  string `json:"access_token"`
	Expiry       int64  `json:"expiry"`
}

// oidcGetLinkHandler returns the link for the configured OIDC provider. The Link can then be used by the user to login.
func oidcGetLinkHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var oidcRequest OIDCRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&oidcRequest)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	ctx, err := oidcContext(r.Context(), oidcRequest.CertificateAuthority)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not create context: %s", err.Error()))
		return
	}

	provider, err := oidc.NewProvider(ctx, oidcRequest.DiscoveryURL)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not create OIDC provider: %s", err.Error()))
		return
	}

	oauth2Config := oauth2.Config{
		ClientID:     oidcRequest.ClientID,
		ClientSecret: oidcRequest.ClientSecret,
		RedirectURL:  oidcRequest.RedirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       []string{oidc.ScopeOpenID},
	}

	oidcResponse := OIDCResponse{
		URL: oauth2Config.AuthCodeURL("", oauth2.AccessTypeOffline, oauth2.ApprovalForce),
	}

	middleware.Write(w, r, oidcResponse)
	return
}

func oidcGetRefreshTokenHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var oidcRequest OIDCRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&oidcRequest)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	ctx, err := oidcContext(r.Context(), oidcRequest.CertificateAuthority)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not create context: %s", err.Error()))
		return
	}

	provider, err := oidc.NewProvider(ctx, oidcRequest.DiscoveryURL)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not create OIDC provider: %s", err.Error()))
		return
	}

	oauth2Config := oauth2.Config{
		ClientID:     oidcRequest.ClientID,
		ClientSecret: oidcRequest.ClientSecret,
		RedirectURL:  oidcRequest.RedirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       []string{oidc.ScopeOpenID},
	}

	oauth2Token, err := oauth2Config.Exchange(ctx, oidcRequest.Code)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not get oauth token: %s", err.Error()))
		return
	}

	idToken, ok := oauth2Token.Extra("id_token").(string)
	if !ok {
		middleware.Errorf(w, r, nil, http.StatusInternalServerError, "Could not get id token")
		return
	}

	oidcResponse := OIDCResponse{
		IDToken:      idToken,
		RefreshToken: oauth2Token.RefreshToken,
		AccessToken:  oauth2Token.AccessToken,
		Expiry:       oauth2Token.Expiry.Unix(),
	}

	middleware.Write(w, r, oidcResponse)
	return
}

// OIDCGetAccessToken is used to retrieve an access token from a refresh token.
func oidcGetAccessTokenHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var oidcRequest OIDCRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&oidcRequest)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	ctx, err := oidcContext(r.Context(), oidcRequest.CertificateAuthority)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not create context: %s", err.Error()))
		return
	}

	provider, err := oidc.NewProvider(ctx, oidcRequest.DiscoveryURL)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not create OIDC provider: %s", err.Error()))
		return
	}

	oauth2Config := oauth2.Config{
		ClientID:     oidcRequest.ClientID,
		ClientSecret: oidcRequest.ClientSecret,
		RedirectURL:  oidcRequest.RedirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       []string{oidc.ScopeOpenID},
	}

	ts := oauth2Config.TokenSource(ctx, &oauth2.Token{RefreshToken: oidcRequest.RefreshToken})
	token, err := ts.Token()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, fmt.Sprintf("Could not get token: %s", err.Error()))
		return
	}

	oidcResponse := OIDCResponse{
		IDToken:      fmt.Sprintf("%s", token.Extra("id_token")),
		RefreshToken: token.RefreshToken,
		AccessToken:  token.AccessToken,
		Expiry:       token.Expiry.Unix(),
	}

	middleware.Write(w, r, oidcResponse)
	return
}

// oidcContext creates the context for the HTTP requests against the OIDC provider. If the OIDC provider uses a self
// signed certificate, it will be included in the context.
//
// NOTE: The certificateAuthority field correlates to the idp-certificate-authority field in the Kubeconfig
// auth-provider section.
func oidcContext(ctx context.Context, certificateAuthority string) (context.Context, error) {
	if certificateAuthority == "" {
		return ctx, nil
	}

	tlsConfig := &tls.Config{RootCAs: x509.NewCertPool()}
	rootCA := []byte(certificateAuthority)

	if !tlsConfig.RootCAs.AppendCertsFromPEM(rootCA) {
		return ctx, fmt.Errorf("no certs found in root CA file")
	}

	client := &http.Client{
		Transport: &http.Transport{
			TLSClientConfig: tlsConfig,
		},
	}

	return oidc.ClientContext(ctx, client), nil

}
