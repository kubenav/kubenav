package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"

	"github.com/kubenav/kubenav/pkg/electron"
	"github.com/kubenav/kubenav/pkg/electron/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/sirupsen/logrus"
	_ "k8s.io/client-go/plugin/pkg/client/auth"
)

var (
	debugFlag             = flag.Bool("debug", false, "Enable debug mode.")
	incluster             = flag.Bool("incluster", false, "Use the in cluster configuration. Only needed for a Kubernetes based Deployment using the Docker image.")
	kubeconfigFlag        = flag.String("kubeconfig", "", "Optional Kubeconfig file.")
	kubeconfigIncludeFlag = flag.String("kubeconfig-include", "", "Comma separated list of globs to include in the Kubeconfig.")
	kubeconfigExcludeFlag = flag.String("kubeconfig-exclude", "", "Comma separated list of globs to exclude from the Kubeconfig. This flag must be used in combination with the '-kubeconfig-include' flag.")
	syncFlag              = flag.Bool("sync", false, "Sync the changes from kubenav with the used Kubeconfig file.")
)

func main() {
	// Parse command-line flags.
	flag.Parse()

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
	client, err := kube.NewClient(*incluster, *kubeconfigFlag, *kubeconfigIncludeFlag, *kubeconfigExcludeFlag)
	if err != nil {
		log.WithError(err).Fatalf("Could not create Kubernetes client")
	}

	// Register the API for the Electron app and start the server.
	router := http.NewServeMux()
	electron.Register(router, *syncFlag, client)

	index, err := ioutil.ReadFile("build/index.html")
	if err != nil {
		log.WithError(err).Fatalf("Could not load index.html file")
	}

	staticHandler := http.StripPrefix("/", http.FileServer(http.Dir("build")))
	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if strings.Contains(r.URL.Path, ".") {
			staticHandler.ServeHTTP(w, r)
			return
		}

		fmt.Fprintf(w, string(index))
	})

	if err := http.ListenAndServe(":14122", router); err != nil {
		log.WithError(err).Fatalf("kubenav server died")
	}
}
