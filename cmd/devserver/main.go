package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/kubenav/kubenav/pkg/electron"
	"github.com/kubenav/kubenav/pkg/electron/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

var (
	debug      bool
	kubeconfig string
	sync       bool
)

var rootCmd = &cobra.Command{
	Use:   "kubenav",
	Short: "kubenav - the navigator for your Kubernetes clusters.",
	Long:  "kubenav - the navigator for your Kubernetes clusters.",
	Run: func(cmd *cobra.Command, args []string) {
		log := logrus.StandardLogger()

		logLevel := logrus.InfoLevel
		if debug {
			logLevel = logrus.DebugLevel
		}

		log.SetLevel(logLevel)
		log.Infof(version.Info())
		log.Infof(version.BuildContext())

		client, err := kube.NewClient(kubeconfig)
		if err != nil {
			log.WithError(err).Fatalf("Could not create Kubernetes client")
		}

		router := http.NewServeMux()
		electron.Register(router, sync, client)

		if err := http.ListenAndServe(":14122", router); err != nil {
			log.WithError(err).Fatalf("kubenav server died")
		}
	},
}

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print version information for kubenav.",
	Long:  "Print version information for kubenav.",
	Run: func(cmd *cobra.Command, args []string) {
		v, err := version.Print("kubenav")
		if err != nil {
			logrus.WithError(err).Fatal("Failed to print version information")
		}

		fmt.Fprintln(os.Stdout, v)
	},
}

func init() {
	rootCmd.AddCommand(versionCmd)

	rootCmd.PersistentFlags().BoolVar(&debug, "debug", false, "Enable debug mode.")
	rootCmd.PersistentFlags().StringVar(&kubeconfig, "kubeconfig", "", "Optional Kubeconfig file.")
	rootCmd.PersistentFlags().BoolVar(&sync, "sync", false, "Sync the changes from kubenav with the used Kubeconfig file.")
}

func main() {
	if err := rootCmd.Execute(); err != nil {
		logrus.WithError(err).Fatal("Failed to initialize kubenav")
	}
}
