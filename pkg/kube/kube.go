package kube

import (
	"github.com/kubenav/kubenav/pkg/kube/desktop"
	"github.com/kubenav/kubenav/pkg/kube/mobile"

	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
)

// Client is the interface which must be implemented by the mobile and desktop client to interact with the Kubernetes
// API.
type Client interface {
	GetPlatform() string
	GetClusters() (string, map[string]string)
	GetClient(contextName, clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64) (*rest.Config, *kubernetes.Clientset, error)
}

// NewClient return the mobile or desktop client depending on the specified platform.
func NewClient(platform string) Client {
	if platform == mobile.Platform {
		return mobile.NewClient()
	}

	if platform == desktop.Platform {
		return desktop.NewClient()
	}

	return nil
}
