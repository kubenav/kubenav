package kubenav

import (
	"bytes"
	"compress/gzip"
	"context"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io"
	"sort"
	"strconv"
	"time"

	"github.com/kubenav/kubenav/pkg/kube"

	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// Release describes a deployment of a chart, together with the chart and the variables used to deploy that chart.
type Release struct {
	// Name is the name of the release
	Name string `json:"name,omitempty"`
	// Info provides information about a release
	Info *Info `json:"info,omitempty"`
	// Chart is the chart that was released.
	Chart *Chart `json:"chart,omitempty"`
	// Config is the set of extra Values added to the chart.
	// These values override the default values inside of the chart.
	Config map[string]interface{} `json:"config,omitempty"`
	// Manifest is the string representation of the rendered template.
	Manifest string `json:"manifest,omitempty"`
	// Hooks are all of the hooks declared for this release.
	Hooks []*Hook `json:"hooks,omitempty"`
	// Version is an int which represents the revision of the release.
	Version int `json:"version,omitempty"`
	// Namespace is the kubernetes namespace of the release.
	Namespace string `json:"namespace,omitempty"`
	// Labels of the release.
	// Disabled encoding into Json cause labels are stored in storage driver metadata field.
	Labels map[string]string `json:"-"`
}

// Info describes release information.
type Info struct {
	// FirstDeployed is when the release was first deployed.
	FirstDeployed string `json:"first_deployed,omitempty"`
	// LastDeployed is when the release was last deployed.
	LastDeployed string `json:"last_deployed,omitempty"`
	// Deleted tracks when this object was deleted.
	Deleted string `json:"deleted,omitempty"`
	// Description is human-friendly "log entry" about this release.
	Description string `json:"description,omitempty"`
	// Status is the current state of the release
	Status Status `json:"status,omitempty"`
	// Contains the rendered templates/NOTES.txt if available
	Notes string `json:"notes,omitempty"`
}

// Status is the status of a release
type Status string

// Describe the status of a release
const (
	// StatusUnknown indicates that a release is in an uncertain state.
	StatusUnknown Status = "unknown"
	// StatusDeployed indicates that the release has been pushed to Kubernetes.
	StatusDeployed Status = "deployed"
	// StatusUninstalled indicates that a release has been uninstalled from Kubernetes.
	StatusUninstalled Status = "uninstalled"
	// StatusSuperseded indicates that this release object is outdated and a newer one exists.
	StatusSuperseded Status = "superseded"
	// StatusFailed indicates that the release was not successfully deployed.
	StatusFailed Status = "failed"
	// StatusUninstalling indicates that a uninstall operation is underway.
	StatusUninstalling Status = "uninstalling"
	// StatusPendingInstall indicates that an install operation is underway.
	StatusPendingInstall Status = "pending-install"
	// StatusPendingUpgrade indicates that an upgrade operation is underway.
	StatusPendingUpgrade Status = "pending-upgrade"
	// StatusPendingRollback indicates that an rollback operation is underway.
	StatusPendingRollback Status = "pending-rollback"
)

type Chart struct {
	// Raw contains the raw contents of the files originally contained in the chart archive.
	//
	// This should not be used except in special cases like `helm show values`,
	// where we want to display the raw values, comments and all.
	Raw []*File `json:"-"`
	// Metadata is the contents of the Chartfile.
	Metadata *Metadata `json:"metadata"`
	// Lock is the contents of Chart.lock.
	Lock *Lock `json:"lock"`
	// Templates for this chart.
	Templates []*File `json:"templates"`
	// Values are default config for this chart.
	Values map[string]interface{} `json:"values"`
	// Schema is an optional JSON schema for imposing structure on Values
	Schema []byte `json:"schema"`
	// Files are miscellaneous files in a chart archive,
	// e.g. README, LICENSE, etc.
	Files []*File `json:"files"`

	parent       *Chart
	dependencies []*Chart
}

type File struct {
	// Name is the path-like name of the template.
	Name string `json:"name"`
	// Data is the template as byte data.
	Data []byte `json:"data"`
}

// Metadata for a Chart file. This models the structure of a Chart.yaml file.
type Metadata struct {
	// The name of the chart. Required.
	Name string `json:"name,omitempty"`
	// The URL to a relevant project page, git repo, or contact person
	Home string `json:"home,omitempty"`
	// Source is the URL to the source code of this chart
	Sources []string `json:"sources,omitempty"`
	// A SemVer 2 conformant version string of the chart. Required.
	Version string `json:"version,omitempty"`
	// A one-sentence description of the chart
	Description string `json:"description,omitempty"`
	// A list of string keywords
	Keywords []string `json:"keywords,omitempty"`
	// A list of name and URL/email address combinations for the maintainer(s)
	Maintainers []*Maintainer `json:"maintainers,omitempty"`
	// The URL to an icon file.
	Icon string `json:"icon,omitempty"`
	// The API Version of this chart. Required.
	APIVersion string `json:"apiVersion,omitempty"`
	// The condition to check to enable chart
	Condition string `json:"condition,omitempty"`
	// The tags to check to enable chart
	Tags string `json:"tags,omitempty"`
	// The version of the application enclosed inside of this chart.
	AppVersion string `json:"appVersion,omitempty"`
	// Whether or not this chart is deprecated
	Deprecated bool `json:"deprecated,omitempty"`
	// Annotations are additional mappings uninterpreted by Helm,
	// made available for inspection by other applications.
	Annotations map[string]string `json:"annotations,omitempty"`
	// KubeVersion is a SemVer constraint specifying the version of Kubernetes required.
	KubeVersion string `json:"kubeVersion,omitempty"`
	// Dependencies are a list of dependencies for a chart.
	Dependencies []*Dependency `json:"dependencies,omitempty"`
	// Specifies the chart type: application or library
	Type string `json:"type,omitempty"`
}

// Maintainer describes a Chart maintainer.
type Maintainer struct {
	// Name is a user name or organization name
	Name string `json:"name,omitempty"`
	// Email is an optional email address to contact the named maintainer
	Email string `json:"email,omitempty"`
	// URL is an optional URL to an address for the named maintainer
	URL string `json:"url,omitempty"`
}

// Dependency describes a chart upon which another chart depends.
//
// Dependencies can be used to express developer intent, or to capture the state
// of a chart.
type Dependency struct {
	// Name is the name of the dependency.
	//
	// This must mach the name in the dependency's Chart.yaml.
	Name string `json:"name"`
	// Version is the version (range) of this chart.
	//
	// A lock file will always produce a single version, while a dependency
	// may contain a semantic version range.
	Version string `json:"version,omitempty"`
	// The URL to the repository.
	//
	// Appending `index.yaml` to this string should result in a URL that can be
	// used to fetch the repository index.
	Repository string `json:"repository"`
	// A yaml path that resolves to a boolean, used for enabling/disabling charts (e.g. subchart1.enabled )
	Condition string `json:"condition,omitempty"`
	// Tags can be used to group charts for enabling/disabling together
	Tags []string `json:"tags,omitempty"`
	// Enabled bool determines if chart should be loaded
	Enabled bool `json:"enabled,omitempty"`
	// ImportValues holds the mapping of source values to parent key to be imported. Each item can be a
	// string or pair of child/parent sublist items.
	ImportValues []interface{} `json:"import-values,omitempty"`
	// Alias usable alias to be used for the chart
	Alias string `json:"alias,omitempty"`
}

// Lock is a lock file for dependencies.
//
// It represents the state that the dependencies should be in.
type Lock struct {
	// Generated is the date the lock file was last generated.
	Generated string `json:"generated,omitempty"`
	// Digest is a hash of the dependencies in Chart.yaml.
	Digest string `json:"digest"`
	// Dependencies is the list of dependencies that this lock file has locked.
	Dependencies []*Dependency `json:"dependencies"`
}

// Hook defines a hook object.
type Hook struct {
	Name string `json:"name,omitempty"`
	// Kind is the Kubernetes kind.
	Kind string `json:"kind,omitempty"`
	// Path is the chart-relative path to the template.
	Path string `json:"path,omitempty"`
	// Manifest is the manifest contents.
	Manifest string `json:"manifest,omitempty"`
	// Events are the events that this hook fires on.
	Events []HookEvent `json:"events,omitempty"`
	// LastRun indicates the date/time this was last run.
	LastRun HookExecution `json:"last_run,omitempty"`
	// Weight indicates the sort order for execution among similar Hook type
	Weight int `json:"weight,omitempty"`
	// DeletePolicies are the policies that indicate when to delete the hook
	DeletePolicies []HookDeletePolicy `json:"delete_policies,omitempty"`
}

// A HookExecution records the result for the last execution of a hook for a given release.
type HookExecution struct {
	// StartedAt indicates the date/time this hook was started
	StartedAt string `json:"started_at,omitempty"`
	// CompletedAt indicates the date/time this hook was completed.
	CompletedAt string `json:"completed_at,omitempty"`
	// Phase indicates whether the hook completed successfully
	Phase HookPhase `json:"phase"`
}

// A HookPhase indicates the state of a hook execution
type HookPhase string

const (
	// HookPhaseUnknown indicates that a hook is in an unknown state
	HookPhaseUnknown HookPhase = "Unknown"
	// HookPhaseRunning indicates that a hook is currently executing
	HookPhaseRunning HookPhase = "Running"
	// HookPhaseSucceeded indicates that hook execution succeeded
	HookPhaseSucceeded HookPhase = "Succeeded"
	// HookPhaseFailed indicates that hook execution failed
	HookPhaseFailed HookPhase = "Failed"
)

// HookEvent specifies the hook event
type HookEvent string

// Hook event types
const (
	HookPreInstall   HookEvent = "pre-install"
	HookPostInstall  HookEvent = "post-install"
	HookPreDelete    HookEvent = "pre-delete"
	HookPostDelete   HookEvent = "post-delete"
	HookPreUpgrade   HookEvent = "pre-upgrade"
	HookPostUpgrade  HookEvent = "post-upgrade"
	HookPreRollback  HookEvent = "pre-rollback"
	HookPostRollback HookEvent = "post-rollback"
	HookTest         HookEvent = "test"
)

// HookDeletePolicy specifies the hook delete policy
type HookDeletePolicy string

// Hook delete policy types
const (
	HookSucceeded          HookDeletePolicy = "hook-succeeded"
	HookFailed             HookDeletePolicy = "hook-failed"
	HookBeforeHookCreation HookDeletePolicy = "before-hook-creation"
)

// secretDataToRelease converts the secret data from the "release" key to an actual Helm release. For this we have to
// decode the base64 encoded secret data and the uncrompress it using the "decompress" function.
func secretDataToRelease(secretData []byte) (*Release, error) {
	releaseData, err := base64.StdEncoding.DecodeString(string(secretData))
	if err != nil {
		return nil, err
	}

	releaseDataUnzipped, err := decompress(releaseData)
	if err != nil {
		return nil, err
	}

	var release Release
	err = json.Unmarshal(releaseDataUnzipped, &release)
	if err != nil {
		return nil, err
	}

	return &release, nil
}

// decompress is used to unzip the gzipped release data for a Helm release.
func decompress(data []byte) ([]byte, error) {
	b := bytes.NewBuffer(data)

	var r io.Reader
	r, err := gzip.NewReader(b)
	if err != nil {
		return nil, err
	}

	var res bytes.Buffer
	_, err = res.ReadFrom(r)
	if err != nil {
		return nil, err
	}

	return res.Bytes(), nil
}

// HelmListCharts returns a list of Helm charts for the given cluster and namespace. If an error occures during the
// process the error is returned.
func HelmListCharts(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, namespace string) (string, error) {
	_, clientset, err := kube.GetClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword)
	if err != nil {
		return "", err
	}

	ctx, cancel := context.WithTimeout(context.Background(), 120*time.Second)
	defer cancel()

	secretList, err := clientset.CoreV1().Secrets(namespace).List(ctx, metav1.ListOptions{
		LabelSelector: "owner=helm",
	})
	if err != nil {
		return "", err
	}

	var secrets map[string][]corev1.Secret
	secrets = make(map[string][]corev1.Secret)

	for _, secretItem := range secretList.Items {
		key := secretItem.Namespace + "_" + secretItem.Labels["name"]

		if _, ok := secrets[key]; ok {
			secrets[key] = append(secrets[key], secretItem)
		} else {
			secrets[key] = []corev1.Secret{secretItem}
		}
	}

	for key := range secrets {
		sort.Slice(secrets[key], func(i, j int) bool {
			v1, _ := strconv.ParseInt(secrets[key][i].Labels["version"], 10, 64)
			v2, _ := strconv.ParseInt(secrets[key][j].Labels["version"], 10, 64)

			return v1 > v2
		})
	}

	var releases []*Release

	for _, secret := range secrets {
		release, err := secretDataToRelease(secret[0].Data["release"])
		if err != nil {
			return "", err
		}

		releases = append(releases, release)
	}

	releasesBytes, err := json.Marshal(releases)
	if err != nil {
		return "", err
	}

	return string(releasesBytes), nil
}

// HelmGetChart returns a single of Helm chart. The Helm chart is identified by it's namespace, name and version. If an
// error occures during the process the error is returned.
func HelmGetChart(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, namespace, name string, version int64) (string, error) {
	_, clientset, err := kube.GetClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword)
	if err != nil {
		return "", err
	}

	ctx, cancel := context.WithTimeout(context.Background(), 120*time.Second)
	defer cancel()

	secretList, err := clientset.CoreV1().Secrets(namespace).List(ctx, metav1.ListOptions{
		LabelSelector: fmt.Sprintf("name=%s,owner=helm,version=%d", name, version),
	})
	if err != nil {
		return "", err
	}

	if len(secretList.Items) != 1 {
		return "", fmt.Errorf("wrong number of secrets")
	}

	release, err := secretDataToRelease(secretList.Items[0].Data["release"])
	if err != nil {
		return "", err
	}

	releaseBytes, err := json.Marshal(release)
	if err != nil {
		return "", err
	}

	return string(releaseBytes), nil
}

// HelmGetHistory returns the History of a Helm chart. The Helm chart is identified by it's namespace and name. If an
// error occures during the process the error is returned.
func HelmGetHistory(clusterServer, clusterCertificateAuthorityData string, clusterInsecureSkipTLSVerify bool, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, namespace, name string) (string, error) {
	_, clientset, err := kube.GetClient(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword)
	if err != nil {
		return "", err
	}

	ctx, cancel := context.WithTimeout(context.Background(), 120*time.Second)
	defer cancel()

	secretList, err := clientset.CoreV1().Secrets(namespace).List(ctx, metav1.ListOptions{
		LabelSelector: fmt.Sprintf("name=%s,owner=helm", name),
	})
	if err != nil {
		return "", err
	}

	var releases []*Release

	for _, secretsItem := range secretList.Items {
		release, err := secretDataToRelease(secretsItem.Data["release"])
		if err != nil {
			return "", err
		}

		releases = append(releases, release)
	}

	releasesBytes, err := json.Marshal(releases)
	if err != nil {
		return "", err
	}

	return string(releasesBytes), nil
}
