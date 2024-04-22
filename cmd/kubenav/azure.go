package kubenav

import (
	"context"
	"encoding/json"
	"fmt"
	"strings"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore/arm"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/containerservice/armcontainerservice"
	"sigs.k8s.io/yaml"
)

// AzureCluster represents a single Azure cluster, with it's name and
// kubeconfig.
type AzureCluster struct {
	Name       string      `json:"name"`
	Kubeconfig interface{} `json:"kubeconfig"`
}

// AzureGetClusters returns all clusters wich are available with the provided
// Azure credentials, the returned JSON encoded string contains all the clusters
// with there name and kubeconfig.
func AzureGetClusters(subscriptionID, tenantID, clientID, clientSecret string, isAdmin bool) (string, error) {
	credentials, err := azidentity.NewClientSecretCredential(tenantID, clientID, clientSecret, nil)
	if err != nil {
		return "", err
	}

	managedClustersClient, err := armcontainerservice.NewManagedClustersClient(subscriptionID, credentials, &arm.ClientOptions{})
	if err != nil {
		return "", err
	}

	ctx := context.Background()
	var managedClusters []*armcontainerservice.ManagedCluster
	var clusters []AzureCluster

	pager := managedClustersClient.NewListPager(&armcontainerservice.ManagedClustersClientListOptions{})

	for pager.More() {
		page, err := pager.NextPage(ctx)
		if err != nil {
			return "", err
		}

		managedClusters = append(managedClusters, page.Value...)
	}

	for _, managedCluster := range managedClusters {
		var result []*armcontainerservice.CredentialResult
		name := *managedCluster.Name
		resourceGroupName := strings.Split(*managedCluster.ID, "/")[4]

		if isAdmin {
			resp, err := managedClustersClient.ListClusterAdminCredentials(ctx, resourceGroupName, name, &armcontainerservice.ManagedClustersClientListClusterAdminCredentialsOptions{})
			if err != nil {
				return "", err
			}
			result = resp.CredentialResults.Kubeconfigs
		} else {
			resp, err := managedClustersClient.ListClusterUserCredentials(ctx, resourceGroupName, name, &armcontainerservice.ManagedClustersClientListClusterUserCredentialsOptions{})
			if err != nil {
				return "", err
			}
			result = resp.CredentialResults.Kubeconfigs
		}

		for _, kubeconfig := range result {
			var kubeconfigJSON interface{}
			err := yaml.Unmarshal(kubeconfig.Value, &kubeconfigJSON)
			if err != nil {
				return "", err
			}

			clusters = append(clusters, AzureCluster{
				Name:       fmt.Sprintf("%s_%s_%s", *kubeconfig.Name, resourceGroupName, name),
				Kubeconfig: azureConvertKubeconfig(kubeconfigJSON),
			})
		}
	}

	clustersBytes, err := json.Marshal(clusters)
	if err != nil {
		return "", err
	}

	return string(clustersBytes), nil
}

// convert the map[interface{}]interface{} returned from yaml.Unmarshal to a
// map[string]interface{} for the usage in json.Marshal.
// See: https://stackoverflow.com/a/40737676
func azureConvertKubeconfig(i interface{}) interface{} {
	switch x := i.(type) {
	case map[interface{}]interface{}:
		m2 := map[string]interface{}{}
		for k, v := range x {
			m2[k.(string)] = azureConvertKubeconfig(v)
		}
		return m2
	case []interface{}:
		for i, v := range x {
			x[i] = azureConvertKubeconfig(v)
		}
	}
	return i
}
