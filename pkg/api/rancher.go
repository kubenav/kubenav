package api

import (
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"strconv"

	"github.com/kubenav/kubenav/pkg/api/middleware"
	"gopkg.in/resty.v1"
)

/* Constants */

// Default rest client retries
const restyRetry int = 3

// Default tokenname in rancher
const tokenDescription string = "io.kubenav.kubenav"

/* Structs */

// Model received from app
type RancherRequest struct {
	RancherHost string `json:"rancherHost"`
	RancherPort int    `json:"rancherPort"`
	Secure      bool   `json:"secure"`
	Username    string `json:"username"`
	Password    string `json:"password"`
	BearerToken string `json:"bearerToken"`
	ClusterId   string `json:"clusterId"`
}

// Submodel for general bearer token
type TokenObject struct {
	Id    string `json:"id"`
	Token string `json:"token"`
}

// Model for logging into rancher
type RancherCredentialsRequest struct {
	Username     string `json:"username"`
	Password     string `json:"password"`
	Description  string `json:"description"`
	ResponseType string `json:"responseType"`
	TTL          int    `json:"ttl"`
}

// Model for creating rancher api token
type ApiTokenRequest struct {
	Current     bool   `json:"current"`
	Enabled     bool   `json:"enabled"`
	Expired     bool   `json:"expired"`
	IsDerived   bool   `json:"isDerived"`
	TTL         int    `json:"ttl"`
	Type        string `json:"type"`
	Description string `json:"description"`
	Id          string `json:"id"`
}

// Model for generating kubeconfig from rancher
type GenerateKubeconfig struct {
	BaseType string `json:"baseType"`
	Config   string `json:"config"`
	Type     string `json:"type"`
}

// Submodel for rancher clusters
type Clusters struct {
	Data []struct {
		Id   string `json:"id"`
		Name string `json:"name"`
	} `json:"data"`
}

// Submodel for rancher bearer token
type Tokens struct {
	Data []struct {
		Id          string `json:"id"`
		Name        string `json:"name"`
		Description string `json:"description"`
	} `json:"data"`
}

/* Utility functions */

// Rest client with default parameters
func getDefaultRestClient() (request *resty.Request) {
	return resty.
		SetRetryCount(restyRetry).
		OnAfterResponse(func(c *resty.Client, resp *resty.Response) error {

			if resp.StatusCode() == 401 {
				return errors.New("Unauthorized")
			} else if resp.StatusCode() >= 200 && resp.StatusCode() < 300 {
				return nil
			} else {
				return errors.New("Request was not successful: " + resp.Status())
			}

		}).
		R()
}

// Default rest client with authentication header
func getAuthenticatedRestClient(token *TokenObject) (request *resty.Request) {
	return getDefaultRestClient().
		SetHeader("Authorization", "Bearer "+token.Token)
}

// Function to handle http errors
func logHttpError(resp *resty.Response, err error) {
	rawReq := resp.Request.RawRequest

	fmt.Println("Error: ", err)
	fmt.Println("Request Trace Info: ", rawReq)
}

// Function to build url from parameters
func generateRancherUrl(rancherRequest RancherRequest) (rancherUrl string) {
	var scheme string

	if rancherRequest.Secure {
		scheme = "https"
	} else {
		scheme = "http"
	}

	return scheme + "://" + rancherRequest.RancherHost + ":" + strconv.Itoa(rancherRequest.RancherPort)
}

// Function to either populate tokenObject with provided bearer token or generate session bearer token
func generateTokenObject(rancherRequest RancherRequest) (tokenObject *TokenObject, statusCode int, err error) {

	if rancherRequest.BearerToken != "" {

		tokenObject := &TokenObject{
			Token: rancherRequest.BearerToken,
		}
		return tokenObject, 200, nil
	} else {
		return loginToRancher(generateRancherUrl(rancherRequest), rancherRequest.Username, rancherRequest.Password)
	}
}

/* Rancher rest requests */

// Use this function to create a normal api bearer token
func createAuthToken(url string, sessionToken *TokenObject) (token *TokenObject, statusCode int, err error) {

	apiTokenRequest := ApiTokenRequest{
		Current:     false,
		Enabled:     true,
		Expired:     false,
		IsDerived:   false,
		TTL:         0,
		Type:        "token",
		Description: tokenDescription,
	}

	resp, err := getAuthenticatedRestClient(sessionToken).
		SetBody(apiTokenRequest).
		Post(url + "/v3/token")

	statusCode = resp.StatusCode()

	if err != nil {
		logHttpError(resp, err)
		return nil, statusCode, err
	}

	tokenResponse := TokenObject{}

	json.Unmarshal(resp.Body(), &tokenResponse)

	return &tokenResponse, statusCode, err
}

// Use this function to delete a normal bearer token - for session bearer token use logoutFromRancher function
func deleteAuthToken(url string, token *TokenObject, tokenId string) (statusCode int, err error) {
	resp, err := getAuthenticatedRestClient(token).
		Delete(url + "/v3/token/" + tokenId)

	statusCode = resp.StatusCode()

	if err != nil {
		logHttpError(resp, err)
		return statusCode, err
	}
	return statusCode, err
}

// Use this function to log into rancher and receive a session bearer token
func loginToRancher(url string, username string, password string) (sessionToken *TokenObject, statusCode int, err error) {

	rancherCredentials := RancherCredentialsRequest{
		Username:    username,
		Password:    password,
		Description: "kubenav Session",
		TTL:         57600000,
	}

	resp, err := getDefaultRestClient().
		SetBody(rancherCredentials).
		Post(url + "/v3-public/localProviders/local?action=login")

	statusCode = resp.StatusCode()

	if err != nil {
		logHttpError(resp, err)
		return nil, statusCode, err
	}

	tokenResponse := TokenObject{}

	json.Unmarshal(resp.Body(), &tokenResponse)

	return &tokenResponse, statusCode, err
}

// Use this function to remove a session bearer token - for normal bearer token use deleteAuthToken function
func logoutFromRancher(url string, sessionToken *TokenObject) (statusCode int, err error) {

	resp, err := getAuthenticatedRestClient(sessionToken).
		Post(url + "/v3/tokens?action=logout")

	statusCode = resp.StatusCode()

	if err != nil {
		logHttpError(resp, err)
		return statusCode, err
	}
	return statusCode, err
}

// Use this function to receive all available token for the logged in user (does not include secrets)
func listTokens(url string, token *TokenObject) (tokens *Tokens, statusCode int, err error) {
	resp, err := getAuthenticatedRestClient(token).
		Get(url + "/v3/tokens")

	statusCode = resp.StatusCode()

	if err != nil {
		logHttpError(resp, err)
		return nil, statusCode, err
	}

	json.Unmarshal(resp.Body(), &tokens)

	return tokens, statusCode, err
}

// Use this function to list available clusters
func listClusters(url string, token *TokenObject) (clusters *Clusters, statusCode int, err error) {
	resp, err := getAuthenticatedRestClient(token).
		Get(url + "/v3/clusters")

	statusCode = resp.StatusCode()

	if err != nil {
		logHttpError(resp, err)
		return nil, statusCode, err
	}

	json.Unmarshal(resp.Body(), &clusters)

	return clusters, statusCode, err
}

// Use this function to generate a yaml kubeconfig for a given cluster id
func getKubeConfig(url string, token *TokenObject, clusterId string) (kubeconfig *GenerateKubeconfig, statusCode int, err error) {

	resp, err := getAuthenticatedRestClient(token).
		Post(url + "/v3/clusters/" + clusterId + "?action=generateKubeconfig")

	statusCode = resp.StatusCode()

	if err != nil {
		logHttpError(resp, err)
		return nil, statusCode, err
	}

	generateKubeconfig := GenerateKubeconfig{}

	json.Unmarshal(resp.Body(), &generateKubeconfig)

	return &generateKubeconfig, statusCode, err
}

/* kubenav Api Handler */

// Handler to retrieve kubeconfig for selected cluster in app
func (c *Client) rancherGenerateApiTokenHandler(w http.ResponseWriter, r *http.Request) {

	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}

	var rancherRequest RancherRequest
	err := json.NewDecoder(r.Body).Decode(&rancherRequest)

	if err != nil {
		middleware.Errorf(w, r, nil, http.StatusInternalServerError, err.Error())
		return
	}

	rancherUrl := generateRancherUrl(rancherRequest)

	sessionTokenObject, statusCode, err := loginToRancher(rancherUrl, rancherRequest.Username, rancherRequest.Password)

	if err != nil {
		middleware.Errorf(w, r, nil, statusCode, err.Error())
		return
	}

	tokens, statusCode, err := listTokens(rancherUrl, sessionTokenObject)

	if err != nil {
		middleware.Errorf(w, r, nil, statusCode, err.Error())
		return
	}

	// Delete possible existing tokens from app
	for _, token := range tokens.Data {

		if token.Description == tokenDescription {
			statusCode, err := deleteAuthToken(rancherUrl, sessionTokenObject, token.Id)

			if err != nil {
				middleware.Errorf(w, r, nil, statusCode, err.Error())
				return
			}
		}
	}

	apiTokenObject, statusCode, err := createAuthToken(generateRancherUrl(rancherRequest), sessionTokenObject)

	if err != nil {
		middleware.Errorf(w, r, nil, statusCode, err.Error())
		return
	}

	middleware.Write(w, r, apiTokenObject)
}

// Handler to retrieve all available clusters for logged in user in app
func (c *Client) rancherListClustersHandler(w http.ResponseWriter, r *http.Request) {

	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}

	var rancherRequest RancherRequest
	err := json.NewDecoder(r.Body).Decode(&rancherRequest)

	if err != nil {
		middleware.Errorf(w, r, nil, http.StatusInternalServerError, err.Error())
		return
	}

	tokenObject, statusCode, err := generateTokenObject(rancherRequest)

	if err != nil {
		middleware.Errorf(w, r, nil, statusCode, err.Error())
		return
	}

	rancherUrl := generateRancherUrl(rancherRequest)

	clusters, statusCode, err := listClusters(rancherUrl, tokenObject)

	if err != nil {
		middleware.Errorf(w, r, nil, statusCode, err.Error())
		return
	}

	if rancherRequest.BearerToken == "" {
		statusCode, err := logoutFromRancher(rancherUrl, tokenObject)

		if err != nil {
			middleware.Errorf(w, r, nil, statusCode, err.Error())
			return
		}
	}

	middleware.Write(w, r, clusters)
}

// Handler to generate a yaml kubeconfig for a selected cluster in app
func (c *Client) rancherKubeconfigHandler(w http.ResponseWriter, r *http.Request) {

	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}

	var rancherRequest RancherRequest
	err := json.NewDecoder(r.Body).Decode(&rancherRequest)

	if err != nil {
		middleware.Errorf(w, r, nil, http.StatusInternalServerError, err.Error())
		return
	}

	tokenObject, statusCode, err := generateTokenObject(rancherRequest)

	if err != nil {
		middleware.Errorf(w, r, nil, statusCode, err.Error())
		return
	}

	rancherUrl := generateRancherUrl(rancherRequest)

	kubeconfig, statusCode, err := getKubeConfig(rancherUrl, tokenObject, rancherRequest.ClusterId)

	if err != nil {
		middleware.Errorf(w, r, nil, statusCode, err.Error())
		return
	}

	if rancherRequest.BearerToken == "" {
		statusCode, err := logoutFromRancher(rancherUrl, tokenObject)

		if err != nil {
			middleware.Errorf(w, r, nil, statusCode, err.Error())
			return
		}
	}

	middleware.Write(w, r, kubeconfig)
}
