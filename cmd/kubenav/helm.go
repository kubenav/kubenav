package kubenav

import (
	"encoding/json"
	"sort"
	"time"

	"github.com/kubenav/kubenav/cmd/kubenav/helm"
	"github.com/kubenav/kubenav/cmd/kubenav/kube"
)

type RollbackOptions struct {
	CleanupOnFail bool  `json:"cleanupOnFail"`
	DryRun        bool  `json:"dryRun"`
	Force         bool  `json:"force"`
	MaxHistory    int   `json:"maxHistory"`
	DisableHooks  bool  `json:"disableHooks"`
	Recreate      bool  `json:"recreate"`
	Timeout       int64 `json:"timeout"`
	Wait          bool  `json:"wait"`
	WaitForJobs   bool  `json:"waitForJobs"`
}

// HelmListReleases returns a list of Helm releases for the given cluster and
// namespace. If an error occures during the process the error is returned.
func HelmListReleases(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, namespace string) (string, error) {
	restConfig, _, err := kube.NewClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	client, err := helm.NewClient(restConfig, namespace)
	if err != nil {
		return "", err
	}

	releases, err := client.ListReleases()
	if err != nil {
		return "", err
	}

	sort.Slice(releases, func(i, j int) bool {
		return releases[i].Name < releases[j].Name
	})

	releasesBytes, err := json.Marshal(releases)
	if err != nil {
		return "", err
	}

	return string(releasesBytes), nil
}

// HelmGetRelease returns a single of Helm release. The Helm release is
// identified by it's namespace, name and version. If an error occures during
// the process the error is returned.
func HelmGetRelease(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, namespace, name string, version int64) (string, error) {
	restConfig, _, err := kube.NewClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	client, err := helm.NewClient(restConfig, namespace)
	if err != nil {
		return "", err
	}

	release, err := client.GetRelease(name, version)
	if err != nil {
		return "", err
	}

	releaseBytes, err := json.Marshal(release)
	if err != nil {
		return "", err
	}

	return string(releaseBytes), nil
}

// HelmListReleaseHistory returns the History of a release. The Helm release is
// identified by it's namespace and name. If an error occures during the process
// the error is returned.
func HelmListReleaseHistory(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, namespace, name string) (string, error) {
	restConfig, _, err := kube.NewClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return "", err
	}

	client, err := helm.NewClient(restConfig, namespace)
	if err != nil {
		return "", err
	}

	releases, err := client.ListReleaseHistory(name)
	if err != nil {
		return "", err
	}

	sort.Slice(releases, func(i, j int) bool {
		return releases[i].Version < releases[j].Version
	})

	releasesBytes, err := json.Marshal(releases)
	if err != nil {
		return "", err
	}

	return string(releasesBytes), nil
}

// HelmRollbackRelease rolls back a Helm release. The Helm release is identified
// by it's namespace and name. The Helm release is rolled back to the provided
// version. If an error occures during the process the error is returned.
func HelmRollbackRelease(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy string, timeout int64, namespace, name string, version int64, options string) error {
	restConfig, _, err := kube.NewClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout)
	if err != nil {
		return err
	}

	client, err := helm.NewClient(restConfig, namespace)
	if err != nil {
		return err
	}

	var rollbackOptions RollbackOptions
	err = json.Unmarshal([]byte(options), &rollbackOptions)
	if err != nil {
		return err
	}

	rollbackTimeout := time.Duration(rollbackOptions.Timeout) * time.Second

	return client.RollbackRelease(name, version, rollbackOptions.CleanupOnFail, rollbackOptions.DryRun, rollbackOptions.Force, rollbackOptions.MaxHistory, rollbackOptions.DisableHooks, rollbackOptions.Recreate, rollbackTimeout, rollbackOptions.Wait, rollbackOptions.WaitForJobs)
}
