package main

import (
	"flag"
	"net/http"

	"github.com/kubenav/kubenav/pkg/electron"
	"github.com/kubenav/kubenav/pkg/electron/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/sirupsen/logrus"
)

var (
	debug      = flag.Bool("debug", false, "Enable debug mode.")
	kubeconfig = flag.String("kubeconfig", "", "Optional Kubeconfig file.")
	sync       = flag.Bool("sync", false, "Sync the changes from kubenav with the used Kubeconfig file.")
)

func main() {
	// Parse command-line flags.
	flag.Parse()

	// Setup the logger and print the version information.
	log := logrus.StandardLogger()

	logLevel := logrus.InfoLevel
	if *debug {
		logLevel = logrus.DebugLevel
	}

	log.SetLevel(logLevel)
	log.Infof(version.Info())
	log.Infof(version.BuildContext())

	// Create the client for the interaction with the Kubernetes API.
	client, err := kube.NewClient(*kubeconfig)
	if err != nil {
		log.WithError(err).Fatalf("Could not create Kubernetes client")
	}

	// Register the API for the Electron app and start the server.
	router := http.NewServeMux()
	electron.Register(router, *sync, client)

	if err := http.ListenAndServe(":14122", router); err != nil {
		log.WithError(err).Fatalf("kubenav server died")
	}
}
