package main

import (
	"flag"
	"net/http"

	"github.com/kubenav/kubenav/pkg/electron"
	"github.com/kubenav/kubenav/pkg/electron/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/sirupsen/logrus"
	_ "k8s.io/client-go/plugin/pkg/client/auth/oidc"
)

var (
	debugFlag             = flag.Bool("debug", false, "Enable debug mode.")
	kubeconfigFlag        = flag.String("kubeconfig", "", "Optional Kubeconfig file.")
	kubeconfigIncludeFlag = flag.String("kubeconfig-include", "", "Comma separated list of globs to include in the Kubeconfig. When this option is used the '-kubeconfig' and '-sync' flag is ignored.")
	kubeconfigExcludeFlag = flag.String("kubeconfig-exclude", "", "Comma separated list of globs to exclude from the Kubeconfig. This flag must be used in combination with the '-kubeconfig-include' flag.")
	syncFlag              = flag.Bool("sync", false, "Sync the changes from kubenav with the used Kubeconfig file.")
)

func main() {
	// Parse command-line flags.
	// When the "-kubeconfig-includ" flag is used the sync flag is ignored. Therefor we set the sync value always to
	// false. The same applies for the "-kubeconfig" flag, but this is handled by the Kubernetes client.
	flag.Parse()

	sync := *syncFlag
	if *kubeconfigIncludeFlag != "" {
		sync = false
	}

	// Setup the logger and print the version information.
	log := logrus.StandardLogger()

	logLevel := logrus.InfoLevel
	if *debugFlag {
		logLevel = logrus.DebugLevel
	}

	log.SetLevel(logLevel)
	log.Infof(version.Info())
	log.Infof(version.BuildContext())

	// Create the client for the interaction with the Kubernetes API.
	client, err := kube.NewClient(*kubeconfigFlag, *kubeconfigIncludeFlag, *kubeconfigExcludeFlag)
	if err != nil {
		log.WithError(err).Fatalf("Could not create Kubernetes client")
	}

	// Register the API for the Electron app and start the server.
	router := http.NewServeMux()
	electron.Register(router, sync, client)

	if err := http.ListenAndServe(":14122", router); err != nil {
		log.WithError(err).Fatalf("kubenav server died")
	}
}
