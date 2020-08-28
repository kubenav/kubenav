package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"strings"

	"github.com/kubenav/kubenav/pkg/electron"
	"github.com/kubenav/kubenav/pkg/electron/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	_ "k8s.io/client-go/plugin/pkg/client/auth"
)

var (
	debugFlag             bool
	debugIonicFlag        string
	inclusterFlag         bool
	inclusterNameFlag     string
	kubeconfigFlag        string
	kubeconfigIncludeFlag string
	kubeconfigExcludeFlag string
	syncFlag              bool
)

var rootCmd = &cobra.Command{
	Use:                "kubenav",
	Short:              "kubenav - export Prometheus metrics from your logs.",
	Long:               "kubenav - export Prometheus metrics from your logs.",
	FParseErrWhitelist: cobra.FParseErrWhitelist{UnknownFlags: true},
	Run: func(cmd *cobra.Command, args []string) {
		// Setup the logger and print the version information.
		log := logrus.StandardLogger()

		logLevel := logrus.InfoLevel
		if debugFlag {
			logLevel = logrus.DebugLevel
		}

		log.SetLevel(logLevel)
		log.Infof(version.Info())
		log.Infof(version.BuildContext())

		// Create the client for the interaction with the Kubernetes API.
		client, err := kube.NewClient(inclusterFlag, inclusterNameFlag, kubeconfigFlag, kubeconfigIncludeFlag, kubeconfigExcludeFlag)
		if err != nil {
			log.WithError(err).Fatalf("Could not create Kubernetes client")
		}

		// Register the API for the Electron app and start the server.
		router := http.NewServeMux()
		electron.Register(router, syncFlag, client)

		index, err := ioutil.ReadFile(path.Join(debugIonicFlag, "index.html"))
		if err != nil {
			log.WithError(err).Fatalf("Could not load index.html file")
		}

		staticHandler := http.StripPrefix("/", http.FileServer(http.Dir(debugIonicFlag)))
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
	},
}

var versionCmd = &cobra.Command{
	Use:                "version",
	Short:              "Print version information for kubenav.",
	Long:               "Print version information for kubenav.",
	FParseErrWhitelist: cobra.FParseErrWhitelist{UnknownFlags: true},
	Run: func(cmd *cobra.Command, args []string) {
		v, err := version.Print("kubenav")
		if err != nil {
			logrus.WithError(err).Fatalf("Failed to print version information")
		}

		fmt.Fprintln(os.Stdout, v)
		return
	},
}

func init() {
	rootCmd.AddCommand(versionCmd)

	rootCmd.PersistentFlags().BoolVar(&debugFlag, "debug", false, "Enable debug mode.")
	rootCmd.PersistentFlags().StringVar(&debugIonicFlag, "debug.ionic", "build", "Path to the Ionic app.")
	rootCmd.PersistentFlags().BoolVar(&inclusterFlag, "incluster", false, "Use the in cluster configuration.")
	rootCmd.PersistentFlags().StringVar(&inclusterNameFlag, "incluster.name", "kubenav", "The name which should be displayed when using the incluster flag.")
	rootCmd.PersistentFlags().StringVar(&kubeconfigFlag, "kubeconfig", "", "Optional Kubeconfig file.")
	rootCmd.PersistentFlags().StringVar(&kubeconfigIncludeFlag, "kubeconfig.include", "", "Comma separated list of globs to include in the Kubeconfig.")
	rootCmd.PersistentFlags().StringVar(&kubeconfigExcludeFlag, "kubeconfig.exclude", "", "Comma separated list of globs to exclude from the Kubeconfig. This flag must be used in combination with the '--kubeconfig.include' flag.")
	rootCmd.PersistentFlags().BoolVar(&syncFlag, "kubeconfig.sync", false, "Sync the changes from kubenav with the used Kubeconfig file.")
}

func main() {
	if err := rootCmd.Execute(); err != nil {
		logrus.WithError(err).Fatal("Failed to initialize kubenav")
	}
}
