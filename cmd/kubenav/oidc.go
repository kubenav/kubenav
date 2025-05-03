package kubenav

import (
	"context"
	"crypto/rand"
	"crypto/sha256"
	"crypto/tls"
	"crypto/x509"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/coreos/go-oidc/v3/oidc"
	"golang.org/x/oauth2"
)

// OIDCResponse is the structure of a response for one of the OIDC methods.
type OIDCResponse struct {
	URL          string `json:"url"`
	IDToken      string `json:"idToken"`
	RefreshToken string `json:"refreshToken"`
	Verifier     string `json:"verifier"`
}

// Creates a high-entropy cryptographic random string as per RFC 7636 4.1.
// Internally it uses a 32-octet sequence from the `crypto/rand` PRNG
func createVerifier() (string, error) {
	r := make([]byte, 32)
	_, err := rand.Read(r)
	if err != nil {
		return "", err
	}
	return base64URLEncode(r), nil
}

// Creates a code challenge derived from the code verifier using the "S256" code
// challenge method.
//
//	code_challenge = BASE64URL-ENCODE(SHA256(ASCII(code_verifier)))
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

// oidcContext creates the context for the HTTP requests against the OIDC
// provider. If the OIDC provider uses a self signed certificate, it will be
// included in the context.
//
// NOTE: The certificateAuthority field correlates to the
// idp-certificate-authority field in the Kubeconfig auth-provider section.
func oidcContext(ctx context.Context, certificateAuthority string) (context.Context, error) {
	if certificateAuthority == "" {
		return ctx, nil
	}

	// #nosec G402
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

// OIDCGetLink returns the link for the configured OIDC provider. The Link can
// then be used by the user to login.
func OIDCGetLink(discoveryURL, clientID, clientSecret, certificateAuthority, scopes string, addDefaultScopes bool, redirectURL, pkceMethod, state string) (string, error) {
	defer func() {
		if r := recover(); r != nil {
			log.Printf("panic: %#v", r)
		}
	}()

	ctx, err := oidcContext(context.Background(), certificateAuthority)
	if err != nil {
		return "", err
	}

	provider, err := oidc.NewProvider(ctx, discoveryURL)
	if err != nil {
		return "", err
	}

	parsedScopes := strings.Split(strings.ReplaceAll(scopes, " ", ""), ",")
	if addDefaultScopes {
		parsedScopes = append(parsedScopes, oidc.ScopeOpenID)
		if discoveryURL != "https://accounts.google.com" {
			// Google doesn't support the `offline_access` scope, so that we
			// only add it for non-Google providers.
			// See: https://github.com/kubenav/kubenav/issues/718
			parsedScopes = append(parsedScopes, oidc.ScopeOfflineAccess)
		}
	}

	oauth2Config := oauth2.Config{
		ClientID:     clientID,
		ClientSecret: clientSecret,
		RedirectURL:  redirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       parsedScopes,
	}

	var oidcResponse OIDCResponse

	if pkceMethod == "S256" {
		verifier, err := createVerifier()
		if err != nil {
			return "", err
		}

		challenge := createS256Challenge(verifier)

		oidcResponse = OIDCResponse{
			URL: oauth2Config.AuthCodeURL(
				state,
				oauth2.AccessTypeOffline,
				oauth2.ApprovalForce,
				oauth2.SetAuthURLParam("code_challenge", challenge),
				oauth2.SetAuthURLParam("code_challenge_method", "S256"),
			),
			Verifier: verifier,
		}
	} else {
		oidcResponse = OIDCResponse{
			URL: oauth2Config.AuthCodeURL(
				state,
				oauth2.AccessTypeOffline,
				oauth2.ApprovalForce,
			),
		}
	}

	oidcResponseBytes, err := json.Marshal(oidcResponse)
	if err != nil {
		return "", err
	}

	return string(oidcResponseBytes), nil
}

// OIDCGetRefreshToken returns a refresh token for the configured OIDC provider.
// The refresh token can be used to get a new access token via the
// OIDCGetAccessToken function.
func OIDCGetRefreshToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes string, addDefaultScopes bool, redirectURL, pkceMethod, code, verifier string, useAccessToken bool) (string, error) {
	defer func() {
		if r := recover(); r != nil {
			log.Printf("panic: %#v", r)
		}
	}()

	ctx, err := oidcContext(context.Background(), certificateAuthority)
	if err != nil {
		return "", err
	}

	provider, err := oidc.NewProvider(ctx, discoveryURL)
	if err != nil {
		return "", err
	}

	parsedScopes := strings.Split(strings.ReplaceAll(scopes, " ", ""), ",")
	if addDefaultScopes {
		parsedScopes = append(parsedScopes, oidc.ScopeOpenID)
		if discoveryURL != "https://accounts.google.com" {
			parsedScopes = append(parsedScopes, oidc.ScopeOfflineAccess)
		}
	}

	oauth2Config := oauth2.Config{
		ClientID:     clientID,
		ClientSecret: clientSecret,
		RedirectURL:  redirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       parsedScopes,
	}

	opts := []oauth2.AuthCodeOption{}
	if pkceMethod != "" {
		opts = append(opts, oauth2.SetAuthURLParam("code_verifier", verifier))
	}

	oauth2Token, err := oauth2Config.Exchange(ctx, code, opts...)
	if err != nil {
		return "", err
	}

	idToken := oauth2Token.AccessToken
	if !useAccessToken {
		tmpIDToken, ok := oauth2Token.Extra("id_token").(string)
		if !ok {
			return "", fmt.Errorf("invalid id_token")
		}
		idToken = tmpIDToken
	}

	oidcResponse := OIDCResponse{
		IDToken:      idToken,
		RefreshToken: oauth2Token.RefreshToken,
	}

	oidcResponseBytes, err := json.Marshal(oidcResponse)
	if err != nil {
		return "", err
	}

	return string(oidcResponseBytes), nil
}

// OIDCGetAccessToken is used to retrieve an access token from a refresh token.
func OIDCGetAccessToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes string, addDefaultScopes bool, redirectURL, refreshToken string, useAccessToken bool) (string, error) {
	defer func() {
		if r := recover(); r != nil {
			log.Printf("panic: %#v", r)
		}
	}()

	ctx, err := oidcContext(context.Background(), certificateAuthority)
	if err != nil {
		return "", err
	}

	provider, err := oidc.NewProvider(ctx, discoveryURL)
	if err != nil {
		return "", err
	}

	parsedScopes := strings.Split(strings.ReplaceAll(scopes, " ", ""), ",")
	if addDefaultScopes {
		parsedScopes = append(parsedScopes, oidc.ScopeOpenID)
		if discoveryURL != "https://accounts.google.com" {
			parsedScopes = append(parsedScopes, oidc.ScopeOfflineAccess)
		}
	}

	oauth2Config := oauth2.Config{
		ClientID:     clientID,
		ClientSecret: clientSecret,
		RedirectURL:  redirectURL,
		Endpoint:     provider.Endpoint(),
		Scopes:       parsedScopes,
	}

	ts := oauth2Config.TokenSource(ctx, &oauth2.Token{RefreshToken: refreshToken})
	oauth2Token, err := ts.Token()
	if err != nil {
		return "", err
	}

	idToken := oauth2Token.AccessToken
	if !useAccessToken {
		tmpIDToken, ok := oauth2Token.Extra("id_token").(string)
		if !ok {
			return "", fmt.Errorf("invalid id_token")
		}
		idToken = tmpIDToken
	}

	oidcResponse := OIDCResponse{
		IDToken:      idToken,
		RefreshToken: oauth2Token.RefreshToken,
	}

	oidcResponseBytes, err := json.Marshal(oidcResponse)
	if err != nil {
		return "", err
	}

	return string(oidcResponseBytes), nil
}

func OIDCDeviceAuth(discoveryURL, clientID, certificateAuthority, scopes string, addDefaultScopes bool) (string, error) {
	defer func() {
		if r := recover(); r != nil {
			log.Printf("panic: %#v", r)
		}
	}()

	ctx, err := oidcContext(context.Background(), certificateAuthority)
	if err != nil {
		return "", err
	}

	provider, err := oidc.NewProvider(ctx, discoveryURL)
	if err != nil {
		return "", err
	}

	var claims struct {
		DeviceAuthorizationEndpoint string `json:"device_authorization_endpoint"`
	}
	err = provider.Claims(&claims)
	if err != nil {
		return "", err
	}

	parsedScopes := strings.Split(strings.ReplaceAll(scopes, " ", ""), ",")
	if addDefaultScopes {
		parsedScopes = append(parsedScopes, oidc.ScopeOpenID)
		if discoveryURL != "https://accounts.google.com" {
			parsedScopes = append(parsedScopes, oidc.ScopeOfflineAccess)
		}
	}

	oauth2Config := oauth2.Config{
		ClientID: clientID,
		Endpoint: oauth2.Endpoint{
			AuthURL:       provider.Endpoint().AuthURL,
			DeviceAuthURL: claims.DeviceAuthorizationEndpoint,
			TokenURL:      provider.Endpoint().TokenURL,
		},
		Scopes: parsedScopes,
	}

	deviceAuth, err := oauth2Config.DeviceAuth(ctx)
	if err != nil {
		return "", err
	}

	deviceAuthData, err := json.Marshal(deviceAuth)
	if err != nil {
		return "", err
	}

	return string(deviceAuthData), nil
}

func OIDCDeviceAuthGetRefreshToken(discoveryURL, clientID, certificateAuthority, scopes string, addDefaultScopes bool, deviceCode string, useAccessToken bool) (string, error) {
	defer func() {
		if r := recover(); r != nil {
			log.Printf("panic: %#v", r)
		}
	}()

	ctx, err := oidcContext(context.Background(), certificateAuthority)
	if err != nil {
		return "", err
	}

	provider, err := oidc.NewProvider(ctx, discoveryURL)
	if err != nil {
		return "", err
	}

	var claims struct {
		DeviceAuthorizationEndpoint string `json:"device_authorization_endpoint"`
	}
	err = provider.Claims(&claims)
	if err != nil {
		return "", err
	}

	parsedScopes := strings.Split(strings.ReplaceAll(scopes, " ", ""), ",")
	if addDefaultScopes {
		parsedScopes = append(parsedScopes, oidc.ScopeOpenID)
		if discoveryURL != "https://accounts.google.com" {
			parsedScopes = append(parsedScopes, oidc.ScopeOfflineAccess)
		}
	}

	opts := []oauth2.AuthCodeOption{}
	if strings.HasPrefix(discoveryURL, "https://sts.windows.net/") {
		// Azure Entra ID requires to pass the device code via the `code`
		// parameter instead of the `device_code` parameter.
		opts = append(opts, oauth2.SetAuthURLParam("code", deviceCode))
	}

	oauth2Config := oauth2.Config{
		ClientID: clientID,
		Endpoint: oauth2.Endpoint{
			AuthURL:       provider.Endpoint().AuthURL,
			DeviceAuthURL: claims.DeviceAuthorizationEndpoint,
			TokenURL:      provider.Endpoint().TokenURL,
		},
		Scopes: parsedScopes,
	}

	oauth2Token, err := oauth2Config.DeviceAccessToken(ctx, &oauth2.DeviceAuthResponse{DeviceCode: deviceCode}, opts...)
	if err != nil {
		return "", err
	}

	idToken := oauth2Token.AccessToken
	if !useAccessToken {
		tmpIDToken, ok := oauth2Token.Extra("id_token").(string)
		if !ok {
			return "", fmt.Errorf("invalid id_token")
		}
		idToken = tmpIDToken
	}

	oidcResponse := OIDCResponse{
		IDToken:      idToken,
		RefreshToken: oauth2Token.RefreshToken,
	}

	oidcResponseBytes, err := json.Marshal(oidcResponse)
	if err != nil {
		return "", err
	}

	return string(oidcResponseBytes), nil
}
