package kubenav

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"regexp"
	"strings"

	"github.com/kubenav/kubenav/pkg/kube"

	"k8s.io/apimachinery/pkg/types"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

// KubernetesRequest is used to execute a request against a Kubernetes API. The Kubernetes API server and it's ca are
// specified via the "clusterServer" and "clusterCertificateAuthorityData" arguments. To skip the tls verification the
// request can set the "clusterInsecureSkipTLSVerify" argument to true. To handle the authentication against the API
// server the "user*" arguments can be used.
// The "requestMethod", "requestURL" and "requestBody" arguments are then used for the actually request. E.g. to get all
// Pods from the Kubernetes API the method "GET" and the URL "/api/v1/pods" can be used.
func KubernetesRequest(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, requestMethod, requestURL, requestBody string) (string, error) {
	_, clientset, err := kube.GetClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword)
	if err != nil {
		return "", err
	}

	var responseResult rest.Result
	var statusCode int
	ctx := context.Background()

	requestURL = strings.TrimRight(clusterServer, "/") + requestURL

	if requestMethod == http.MethodGet {
		responseResult = clientset.RESTClient().Get().RequestURI(requestURL).Do(ctx)
	} else if requestMethod == http.MethodDelete {
		responseResult = clientset.RESTClient().Delete().RequestURI(requestURL).Body([]byte(requestBody)).Do(ctx)
	} else if requestMethod == http.MethodPatch {
		responseResult = clientset.RESTClient().Patch(types.JSONPatchType).RequestURI(requestURL).Body([]byte(requestBody)).Do(ctx)
	} else if requestMethod == http.MethodPost {
		responseResult = clientset.RESTClient().Post().RequestURI(requestURL).Body([]byte(requestBody)).Do(ctx)
	}

	if responseResult.Error() != nil {
		return "", responseResult.Error()
	}

	responseResult = responseResult.StatusCode(&statusCode)
	if statusCode == http.StatusUnauthorized {
		return "", fmt.Errorf(http.StatusText(http.StatusUnauthorized))
	}

	responseBody, err := responseResult.Raw()
	if err != nil {
		return "", err
	}

	if statusCode < 200 || statusCode >= 300 {
		return "", fmt.Errorf(string(responseBody))
	}

	return string(responseBody), nil
}

// KubernetesGetLogs returns the logs for a list of pods. The names of the Pods are provided via the "names" parameter,
// which must be a comma separated list of the Pod names. To use this function a user must also provide the namespace,
// container, since and previous parameter.
func KubernetesGetLogs(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, names, namespace, container string, since int64, filter string, previous bool) (string, error) {
	_, clientset, err := kube.GetClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword)
	if err != nil {
		return "", err
	}

	var logs [][]string
	clusterServer = strings.TrimRight(clusterServer, "/")
	podNames := strings.Split(names, ",")

	for _, podName := range podNames {
		podLogs, err := kubernetesGetLogs(clientset, clusterServer, podName, namespace, container, since, filter, previous, len(podNames) != 1)
		if err != nil {
			return "", err
		}

		logs = append(logs, podLogs)
	}

	data := struct {
		Logs [][]string `json:"logs"`
	}{
		logs,
	}

	dataStr, err := json.Marshal(data)
	if err != nil {
		return "", nil
	}

	return string(dataStr), nil
}

func kubernetesGetLogs(clientset *kubernetes.Clientset, clusterServer, name, namespace, container string, since int64, filter string, previous, prefix bool) ([]string, error) {
	var statusCode int
	ctx := context.Background()

	requestURL := fmt.Sprintf("%s/api/v1/namespaces/%s/pods/%s/log?container=%s&sinceSeconds=%d&previous=%t", clusterServer, namespace, name, container, since, previous)
	responseResult := clientset.RESTClient().Get().RequestURI(requestURL).Do(ctx)

	if responseResult.Error() != nil {
		return nil, responseResult.Error()
	}

	responseResult = responseResult.StatusCode(&statusCode)
	if statusCode == http.StatusUnauthorized {
		return nil, fmt.Errorf(http.StatusText(http.StatusUnauthorized))
	}

	responseBody, err := responseResult.Raw()
	if err != nil {
		return nil, err
	}

	if statusCode < 200 || statusCode >= 300 {
		return nil, fmt.Errorf(string(responseBody))
	}

	if filter == "" {
		if !prefix {
			return strings.Split(string(responseBody), "\n"), nil
		}

		var logs []string
		for _, line := range strings.Split(string(responseBody), "\n") {
			logs = append(logs, fmt.Sprintf("%s: %s", name, line))
		}

		return logs, nil
	}

	reg, err := regexp.Compile(filter)
	if err != nil {
		return nil, err
	}

	var logs []string
	for _, line := range strings.Split(string(responseBody), "\n") {
		if reg.MatchString(line) {
			if prefix {
				logs = append(logs, fmt.Sprintf("%s: %s", name, line))
			} else {
				logs = append(logs, line)
			}
		}
	}

	return logs, nil
}
