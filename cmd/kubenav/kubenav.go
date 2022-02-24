package kubenav

import (
	"context"
	"net/http"

	"github.com/kubenav/kubenav/pkg/kube"

	"k8s.io/apimachinery/pkg/types"
	"k8s.io/client-go/rest"
)

// KubernetesRequest is used to execute a request against a Kubernetes API. The Kubernetes API server and it's ca are
// specified via the "clusterServer" and "clusterCertificateAuthorityData" arguments. To skip the tls verification the
// request can set the "clusterInsecureSkipTLSVerify" argument to true. To handle the authentication against the API
// server the "user*" arguments can be used.
// The "requestMethod", "requestURL" and "requestBody" arguments are then used for the actually request. E.g. to get all
// Pods from the Kubernetes API the method "GET" and the URL "/api/v1/pods" can be used.
func KubernetesRequest(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, requestMethod, requestURL, requestBody string) (string, int, error) {
	_, clientset, err := kube.GetClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword)
	if err != nil {
		return "", 0, err
	}

	var responseResult rest.Result
	var statusCode int
	ctx := context.Background()

	if requestMethod == http.MethodGet {
		responseResult = clientset.RESTClient().Get().AbsPath(requestURL).Do(ctx)
	} else if requestMethod == http.MethodDelete {
		responseResult = clientset.RESTClient().Delete().AbsPath(requestURL).Body([]byte(requestBody)).Do(ctx)
	} else if requestMethod == http.MethodPatch {
		responseResult = clientset.RESTClient().Patch(types.JSONPatchType).AbsPath(requestURL).Body([]byte(requestBody)).Do(ctx)
	} else if requestMethod == http.MethodPost {
		responseResult = clientset.RESTClient().Post().AbsPath(requestURL).Body([]byte(requestBody)).Do(ctx)
	}

	if responseResult.Error() != nil {
		return "", 0, responseResult.Error()
	}

	responseResult = responseResult.StatusCode(&statusCode)

	responseBody, err := responseResult.Raw()
	if err != nil {
		return "", statusCode, err
	}

	return string(responseBody), statusCode, nil
}
