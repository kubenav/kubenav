package mobile

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/kubenav/kubenav/pkg/api/middleware"

	"github.com/Azure/azure-sdk-for-go/services/containerservice/mgmt/2020-01-01/containerservice"
	"github.com/Azure/go-autorest/autorest"
	"github.com/Azure/go-autorest/autorest/adal"
	"gopkg.in/yaml.v2"
)

// AzureRequest is the structure of a request for one of the Azure methods.
type AzureRequest struct {
	SubscriptionID    string `json:"subscriptionID"`
	ClientID          string `json:"clientID"`
	ClientSecret      string `json:"clientSecret"`
	TenantID          string `json:"tenantID"`
	ResourceGroupName string `json:"resourceGroupName"`
	Admin             bool   `json:"admin"`
}

// AzureCluster is the structure of the response for loading all clusters from Microsoft Azure.
type AzureCluster struct {
	Name       string      `json:"name"`
	Kubeconfig interface{} `json:"kubeconfig"`
}

// azureGetClustersHandler return all Kubeconfigs for all AKS clusters for the provided subscription and resource group.
func azureGetClustersHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		middleware.Write(w, r, nil)
		return
	}

	var azureRequest AzureRequest
	if r.Body == nil {
		middleware.Errorf(w, r, nil, http.StatusBadRequest, "Request body is empty")
		return
	}
	err := json.NewDecoder(r.Body).Decode(&azureRequest)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not decode request body")
		return
	}

	ctx := context.Background()
	client := containerservice.NewManagedClustersClient(azureRequest.SubscriptionID)

	authorizer, err := getAzureAuthorizer(azureRequest.ClientID, azureRequest.ClientSecret, azureRequest.TenantID)
	if err != nil {
		middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not not create authorizer")
		return
	}
	client.Authorizer = authorizer

	var clusters []AzureCluster

	for list, err := client.ListComplete(ctx); list.NotDone(); err = list.Next() {
		if err != nil {
			middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not list clusters")
			return
		}

		var res containerservice.CredentialResults
		name := *list.Value().Name

		if azureRequest.Admin {
			res, err = client.ListClusterAdminCredentials(ctx, azureRequest.ResourceGroupName, name)
			if err != nil {
				middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not list cluster credentials")
				return
			}
		} else {
			res, err = client.ListClusterUserCredentials(ctx, azureRequest.ResourceGroupName, name)
			if err != nil {
				middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not list cluster credentials")
				return
			}
		}

		for _, kubeconfig := range *res.Kubeconfigs {
			var kubeconfigJSON interface{}
			err := yaml.Unmarshal(*kubeconfig.Value, &kubeconfigJSON)
			if err != nil {
				middleware.Errorf(w, r, err, http.StatusInternalServerError, "Could not umarshal Kubeconfig")
				return
			}

			clusters = append(clusters, AzureCluster{
				Name:       fmt.Sprintf("%s_%s_%s", *kubeconfig.Name, azureRequest.ResourceGroupName, name),
				Kubeconfig: convert(kubeconfigJSON),
			})
		}
	}

	middleware.Write(w, r, clusters)
	return
}

func getAzureAuthorizer(clientID, clientSecret, tenantID string) (autorest.Authorizer, error) {
	oauthConfig, err := adal.NewOAuthConfig("https://login.microsoftonline.com/", tenantID)
	if err != nil {
		return nil, err
	}

	token, err := adal.NewServicePrincipalToken(*oauthConfig, clientID, clientSecret, "https://management.azure.com/")
	if err != nil {
		return nil, err
	}

	return autorest.NewBearerAuthorizer(token), nil
}

// convert the map[interface{}]interface{} returned from yaml.Unmarshal to a map[string]interface{} for the usage in json.Marshal.
// See: https://stackoverflow.com/a/40737676
func convert(i interface{}) interface{} {
	switch x := i.(type) {
	case map[interface{}]interface{}:
		m2 := map[string]interface{}{}
		for k, v := range x {
			m2[k.(string)] = convert(v)
		}
		return m2
	case []interface{}:
		for i, v := range x {
			x[i] = convert(v)
		}
	}
	return i
}
