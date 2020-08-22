package main

import (
	"bufio"
	"fmt"
	"net/http"
	"os"
	"strings"

	"github.com/kubenav/kubenav/pkg/electron"
	"github.com/kubenav/kubenav/pkg/electron/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/asticode/go-astikit"
	"github.com/asticode/go-astilectron"
	bootstrap "github.com/asticode/go-astilectron-bootstrap"
	assetfs "github.com/elazarl/go-bindata-assetfs"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	_ "k8s.io/client-go/plugin/pkg/client/auth"
)

var (
	AppName            string
	VersionAstilectron string
	VersionElectron    string
)

var (
	debugFlag             bool
	kubeconfigFlag        string
	kubeconfigIncludeFlag string
	kubeconfigExcludeFlag string
	syncFlag              bool
)

// Message is the structure of a Server Sent Event, which contains the Event and Data. Server Sent Events are used to
// send actions from the Electron menu to the frontend.
type Message struct {
	Event string
	Data  string
}

var messageChannel = make(chan Message)

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
		client, err := kube.NewClient(false, kubeconfigFlag, kubeconfigIncludeFlag, kubeconfigExcludeFlag)
		if err != nil {
			log.WithError(err).Fatalf("Could not create Kubernetes client")
		}

		// Register the API routes for the Electron app. Additional to the devserver we need another rout to handle the
		// communication between the Electron menu and the frontend via Server Sent Events. We also have to serve the
		// frontend from the embedded assets.
		go func() {
			router := http.NewServeMux()
			electron.Register(router, syncFlag, client)

			// Add route for Server Sent Events. The events are handled via the message channel. Possible events are
			// "navigation" and "cluster". These events are handled by the frontend to navigate to another page or to modify
			// the cluster context.
			router.HandleFunc("/api/electron", func(w http.ResponseWriter, r *http.Request) {
				w.Header().Set("Connection", "keep-alive")
				w.Header().Set("Content-Type", "text/event-stream")
				w.Header().Set("Access-Control-Allow-Origin", "*")

				for {
					select {
					case msg := <-messageChannel:
						log.Debugf("Received message: %#v", msg)
						w.Write([]byte(fmt.Sprintf("event: %s\ndata: %s\n\n", msg.Event, msg.Data)))
						w.(http.Flusher).Flush()
					case <-r.Context().Done():
						return
					}
				}
			})

			// Load the embedded assets and serve all static files. To serve the index.html file we need to read the content
			// of the file first, so we can handle reloads in the frontend for each route.
			afs := &assetfs.AssetFS{
				Asset:     Asset,
				AssetDir:  AssetDir,
				AssetInfo: AssetInfo,
				Prefix:    "/resources/app",
			}

			staticHandler := http.FileServer(afs)

			indexFile, err := afs.Open("index.html")
			if err != nil {
				log.WithError(err).Fatalf("Could not find index.html file")
			}

			reader := bufio.NewReader(indexFile)
			index, _, err := reader.ReadLine()
			if err != nil {
				log.WithError(err).Fatalf("Could not read index.html file")
			}

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
		}()

		// Check if a new version is available and create the menu. For the menu we need the result from the version check
		// and the Kubernetes client and logger.
		updateAvailable := checkVersion(version.Version, log)
		menuOptions, err := getMenuOptions(updateAvailable, client, log)
		if err != nil {
			log.WithError(err).Fatalf("Could not create menu")
		}

		// Run the Electron app via the bootstrapper for astilectron.
		if err := bootstrap.Run(bootstrap.Options{
			Asset:    Asset,
			AssetDir: AssetDir,
			AstilectronOptions: astilectron.Options{
				AppName:            AppName,
				AppIconDarwinPath:  "resources/icon.icns",
				AppIconDefaultPath: "resources/icon.png",
				SingleInstance:     true,
				VersionAstilectron: VersionAstilectron,
				VersionElectron:    VersionElectron,
			},
			Debug:         debugFlag,
			Logger:        log,
			MenuOptions:   menuOptions,
			RestoreAssets: RestoreAssets,
			Windows: []*bootstrap.Window{{
				Homepage: "http://localhost:14122/",
				Options: &astilectron.WindowOptions{
					Center: astikit.BoolPtr(true),
					Height: astikit.IntPtr(920),
					Width:  astikit.IntPtr(1600),
				},
			}},
		}); err != nil {
			log.WithError(err).Fatalf("Running kubenav failed")
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
