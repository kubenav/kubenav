package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"strings"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/handlers/plugins"
	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	_ "k8s.io/client-go/plugin/pkg/client/auth"
)

var (
	debugFlag                   bool
	debugIonicFlag              string
	inclusterFlag               bool
	inclusterNameFlag           string
	kubeconfigFlag              string
	pluginPrometheusAddressFlag string
	pluginPrometheusEnabledFlag bool
)

var rootCmd = &cobra.Command{
	Use:                "kubenav",
	Short:              "kubenav - the navigator for your Kubernetes clusters right in your pocket.",
	Long:               "kubenav - the navigator for your Kubernetes clusters right in your pocket.",
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

		kubeClient, err := kube.NewClient(false, inclusterFlag, inclusterNameFlag, kubeconfigFlag, "", "")
		if err != nil {
			log.WithError(err).Fatalf("Could not create Kubernetes client")
		}

		router := http.NewServeMux()
		apiClient := api.NewClient(false, &plugins.Config{
			PrometheusEnabled: pluginPrometheusEnabledFlag,
			PrometheusAddress: pluginPrometheusAddressFlag,
		}, kubeClient)
		apiClient.Register(router)

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
	rootCmd.PersistentFlags().StringVar(&pluginPrometheusAddressFlag, "plugin.prometheus.address", "", "The address for Prometheus.")
	rootCmd.PersistentFlags().BoolVar(&pluginPrometheusEnabledFlag, "plugin.prometheus.enabled", false, "Enable the Prometheus plugin.")
}

func main() {
	if err := rootCmd.Execute(); err != nil {
		logrus.WithError(err).Fatal("Failed to initialize kubenav")
	}
}
