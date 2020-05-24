package kube

import (
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"strings"

	"k8s.io/client-go/tools/clientcmd"
)

// homeDir returns the users home directory, where the '.kube' directory is located.
// The '.kube' directory contains the configuration file for a Kubernetes cluster.
func homeDir() string {
	if h := os.Getenv("HOME"); h != "" {
		return h
	}

	// Get the home directory on windows.
	return os.Getenv("USERPROFILE")
}

// loadConfigFile loads a single Kubeconfig file. If the "-kubeconfig" flag is set the provided file will be used. If
// the value is empty the "KUBECONFIG" environment variable or the "~/.kube/config" file is used.
func loadConfigFile(kubeconfig string) (clientcmd.ClientConfig, error) {
	if kubeconfig == "" {
		if os.Getenv("KUBECONFIG") == "" {
			if home := homeDir(); home != "" {
				kubeconfig = filepath.Join(home, ".kube", "config")
			} else {
				return nil, ErrConfigNotFound
			}
		} else {
			kubeconfig = os.Getenv("KUBECONFIG")
		}
	}

	return clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
		&clientcmd.ClientConfigLoadingRules{ExplicitPath: kubeconfig},
		&clientcmd.ConfigOverrides{},
	), nil
}

// loadConfigFiles loads and merged multiple Kubeconfig file by the provided glob. If a file matches the exlude glob the
// file isn't included in the final config object.
func loadConfigFiles(includeKubeconfig, excludeKubeconfig string) (clientcmd.ClientConfig, error) {
	includes := getFilesFromString(includeKubeconfig)
	excludes := getFilesFromString(excludeKubeconfig)

	fmt.Println(includes, excludes)

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
//
// Note: On macOS the home directory must be lowercase.
func getFilesFromString(filesStr string) []string {
	home := homeDir()
	if runtime.GOOS == "darwin" {
		home = strings.ToLower(home)
	}

	var files []string
	for _, file := range strings.Split(filesStr, ",") {
		if strings.HasPrefix(file, "~/") {
			files = append(files, home+strings.TrimPrefix(file, "~"))
		} else {
			files = append(files, file)
		}
	}

	return files
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
