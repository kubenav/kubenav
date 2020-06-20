package kube

import (
	"fmt"
	"os"
	"os/user"
	"path"
	"path/filepath"
	"strings"

	"github.com/sirupsen/logrus"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
)

// loadInClusterConfig loads the Kubeconfig from the in cluster configuration.
func loadInClusterConfig() (clientcmd.ClientConfig, error) {
	config, err := rest.InClusterConfig()
	if err != nil {
		return nil, err
	}

	logrus.Infof("%#v\n", config.String())

	return clientcmd.NewClientConfigFromBytes([]byte(`apiVersion: v1
clusters:
- cluster:
    certificate-authority: ` + config.TLSClientConfig.CAFile + `
    server: ` + config.Host + `
  name: kubenav
contexts:
- context:
    cluster: kubenav
    user: kubenav
  name: kubenav
current-context: kubenav
kind: Config
users:
- name: kubenav
  user:
    token: ` + config.BearerToken))

	/*return clientcmd.NewDefaultClientConfig(clientcmdapi.Config{
		APIVersion:     "v1",
		Kind:           "Config",
		CurrentContext: "incluster",
		Contexts: map[string]*clientcmdapi.Context{
			"incluster": {
				Cluster:   "incluster",
				AuthInfo:  "incluster",
				Namespace: "default",
			},
		},
		Clusters: map[string]*clientcmdapi.Cluster{
			"incluster": {
				Server:               config.Host,
				CertificateAuthority: config.TLSClientConfig.CAFile,
			},
		},
		AuthInfos: map[string]*clientcmdapi.AuthInfo{
			"incluster": {
				Token: config.BearerToken,
				//TokenFile: config.BearerTokenFile,
			},
		},
	}, &clientcmd.ConfigOverrides{}), nil*/
}

// loadConfigFile implements the logic from kubectl to load Kubeconfig files. If the -kubeconfig flag is provided this
// file is used. When the flag isn't provided the KUBECONFIG variable or the default Kubeconfig directory is used.
func loadConfigFile(kubeconfig string) (clientcmd.ClientConfig, error) {
	if len(kubeconfig) > 0 {
		return clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
			&clientcmd.ClientConfigLoadingRules{ExplicitPath: kubeconfig},
			&clientcmd.ConfigOverrides{},
		), nil
	}

	loadingRules := clientcmd.NewDefaultClientConfigLoadingRules()
	if _, ok := os.LookupEnv("HOME"); !ok {
		u, err := user.Current()
		if err != nil {
			return nil, fmt.Errorf("could not get current user: %v", err)
		}

		loadingRules.Precedence = append(loadingRules.Precedence, path.Join(u.HomeDir, clientcmd.RecommendedHomeDir, clientcmd.RecommendedFileName))
	}

	return clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
		loadingRules,
		&clientcmd.ConfigOverrides{},
	), nil
}

// loadConfigFiles loads and merged multiple Kubeconfig file by the provided glob. If a file matches the exlude glob the
// file isn't included in the final config object.
//
// Example: -kubeconfig-include ~/Documents/kubeconfigs1/kube*,~/Documents/kubeconfigs2/kube*
func loadConfigFiles(includeKubeconfig, excludeKubeconfig string) (clientcmd.ClientConfig, error) {
	includes, err := getFilesFromString(includeKubeconfig)
	if err != nil {
		return nil, err
	}

	excludes, err := getFilesFromString(excludeKubeconfig)
	if err != nil {
		return nil, err
	}

	includeFiles, err := getFilesForGlobs(includes)
	if err != nil {
		return nil, err
	}

	excludeFiles, err := getFilesForGlobs(excludes)
	if err != nil {
		return nil, err
	}

	var kubeconfigFiles []string
	for _, file := range includeFiles {
		if !fileExistsInFiles(file, excludeFiles) {
			kubeconfigFiles = append(kubeconfigFiles, file)
		}
	}

	return clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
		&clientcmd.ClientConfigLoadingRules{Precedence: kubeconfigFiles},
		&clientcmd.ConfigOverrides{},
	), nil
}

// getFilesFromString returns a slice of files from a single string. The string is splitted by the "," character. If an
// item starts with "~/" the tilde character is replaced with the path of the home directory.
func getFilesFromString(filesStr string) ([]string, error) {
	home, ok := os.LookupEnv("HOME")
	if !ok {
		u, err := user.Current()
		if err != nil {
			return nil, fmt.Errorf("could not get current user: %v", err)
		}

		home = u.HomeDir
	}

	var files []string
	for _, file := range strings.Split(filesStr, ",") {
		if strings.HasPrefix(file, "~/") {
			files = append(files, home+strings.TrimPrefix(file, "~"))
		} else {
			files = append(files, file)
		}
	}

	return files, nil
}

// getFilesForGlobs returns a list of files for a list of globs using the filepath.Glob function. The accepted pattern
// for a glob can be found here: https://golang.org/pkg/path/filepath/#Match
func getFilesForGlobs(globs []string) ([]string, error) {
	var files []string
	for _, glob := range globs {
		f, err := filepath.Glob(glob)
		if err != nil {
			return nil, err
		}
		files = append(files, f...)
	}

	return files, nil
}

// fileExistsInFiles returns true when a file exists in a slice of files. When the file doesn't exists in the slice the
// function returns false.
func fileExistsInFiles(file string, files []string) bool {
	for _, f := range files {
		if f == file {
			return true
		}
	}

	return false
}
