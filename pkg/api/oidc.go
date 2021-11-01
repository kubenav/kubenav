package api

import (
	"context"
	"crypto/rand"
	"crypto/sha256"
	"crypto/tls"
	"crypto/x509"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

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
	Scopes               string `json:"scopes"`
	PKCEMethod           string `json:"pkceMethod"`
	Verifier             string `json:"verifier"`
}

// OIDCResponse is the structure of a response for one of the OIDC methods.
type OIDCResponse struct {
	URL          string `json:"url"`
	IDToken      string `json:"id_token"`
	RefreshToken string `json:"refresh_token"`
	AccessToken  string `json:"access_token"`
	Expiry       int64  `json:"expiry"`
	Verifier     string `json:"verifier"`
}

// Creates a high-entropy cryptographic random string as per RFC 7636 4.1. Internally it uses a
// 32-octet sequence from the `crypto/rand` PRNG
func createVerifier() (string, error) {
	r := make([]byte, 32)
	_, err := rand.Read(r)
	if err != nil {
		return "", err
	}
	return base64URLEncode(r), nil
}

// Creates a code challenge derived from the code verifier using the "S256" code challenge method.
// 	code_challenge = BASE64URL-ENCODE(SHA256(ASCII(code_verifier)))
func createS256Challenge(verifier string) string {
	h := sha256.New()
	h.Write([]byte(verifier))
	sum := h.Sum(nil)
	return base64URLEncode(sum)
}

// Implements a base64urlencode function as defined in RFC 7636 Appendix A.
func base64URLEncode(data []byte) string {
	encoding := base64.URLEncoding.WithPadding(base64.NoPadding)
	return encoding.EncodeToString(data)
}

// oidcGetLinkHandler returns the link for the configured OIDC provider. The Link can then be used by the user to login.
func (c *Client) oidcGetLinkHandler(w http.ResponseWriter, r *http.Request) {
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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	ctx, err := oidcContext(r.Context(), oidcRequest.CertificateAuthority)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create context: %s", err.Error()))
		return
	}

	provider, err := oidc.NewProvider(ctx, oidcRequest.DiscoveryURL)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create OIDC provider: %s", err.Error()))
		return
	}

	oidcRequest.Scopes = strings.ReplaceAll(oidcRequest.Scopes, " ", "")
	scopes := strings.Split(oidcRequest.Scopes, ",")
	scopes = append(scopes, oidc.ScopeOpenID)

	oauth2Config := oauth2.Config{
		ClientID:     oidcRequest.ClientID,
		ClientSecret: oidcRequest.ClientSecret,
		RedirectURL:  oidcRequest.RedirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       scopes,
	}

	var oidcResponse OIDCResponse

	if oidcRequest.PKCEMethod == "S256" {
		verifier, err := createVerifier()
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create OIDC PKCE verifier: %s", err.Error()))
			return
		}

		challenge := createS256Challenge(verifier)

		oidcResponse = OIDCResponse{
			URL: oauth2Config.AuthCodeURL("",
				oauth2.AccessTypeOffline,
				oauth2.ApprovalForce,
				oauth2.SetAuthURLParam("code_challenge", challenge),
				oauth2.SetAuthURLParam("code_challenge_method", "S256"),
			),
			Verifier: verifier,
		}
	} else {
		oidcResponse = OIDCResponse{
			URL: oauth2Config.AuthCodeURL("", oauth2.AccessTypeOffline, oauth2.ApprovalForce),
		}
	}

	middleware.Write(w, r, oidcResponse)
	return
}

// oidcGetRefreshTokenHandler returns a refresh token for the configured OIDC provider. The refresh token can be used to
// get a new access token via the oidcGetAccessTokenHandler function.
func (c *Client) oidcGetRefreshTokenHandler(w http.ResponseWriter, r *http.Request) {
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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	ctx, err := oidcContext(r.Context(), oidcRequest.CertificateAuthority)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create context: %s", err.Error()))
		return
	}

	provider, err := oidc.NewProvider(ctx, oidcRequest.DiscoveryURL)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create OIDC provider: %s", err.Error()))
		return
	}

	oidcRequest.Scopes = strings.ReplaceAll(oidcRequest.Scopes, " ", "")
	scopes := strings.Split(oidcRequest.Scopes, ",")
	scopes = append(scopes, oidc.ScopeOpenID)

	oauth2Config := oauth2.Config{
		ClientID:     oidcRequest.ClientID,
		ClientSecret: oidcRequest.ClientSecret,
		RedirectURL:  oidcRequest.RedirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       scopes,
	}

	opts := []oauth2.AuthCodeOption{}
	if oidcRequest.PKCEMethod != "" {
		opts = append(opts, oauth2.SetAuthURLParam("code_verifier", oidcRequest.Verifier))
	}

	oauth2Token, err := oauth2Config.Exchange(ctx, oidcRequest.Code, opts...)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not get oauth token: %s", err.Error()))
		return
	}

	idToken, ok := oauth2Token.Extra("id_token").(string)
	if !ok {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Could not get id token")
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

// oidcGetAccessTokenHandler is used to retrieve an access token from a refresh token.
func (c *Client) oidcGetAccessTokenHandler(w http.ResponseWriter, r *http.Request) {
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
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not decode request body: %s", err.Error()))
		return
	}

	ctx, err := oidcContext(r.Context(), oidcRequest.CertificateAuthority)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create context: %s", err.Error()))
		return
	}

	provider, err := oidc.NewProvider(ctx, oidcRequest.DiscoveryURL)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not create OIDC provider: %s", err.Error()))
		return
	}

	oidcRequest.Scopes = strings.ReplaceAll(oidcRequest.Scopes, " ", "")
	scopes := strings.Split(oidcRequest.Scopes, ",")
	scopes = append(scopes, oidc.ScopeOpenID)

	oauth2Config := oauth2.Config{
		ClientID:     oidcRequest.ClientID,
		ClientSecret: oidcRequest.ClientSecret,
		RedirectURL:  oidcRequest.RedirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       scopes,
	}

	ts := oauth2Config.TokenSource(ctx, &oauth2.Token{RefreshToken: oidcRequest.RefreshToken})
	token, err := ts.Token()
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusBadRequest, fmt.Sprintf("Could not get token: %s", err.Error()))
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
