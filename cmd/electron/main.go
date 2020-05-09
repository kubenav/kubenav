package main

import (
	"bufio"
	"fmt"
	"net/http"
	"os"
	"strings"

	"github.com/kubenav/kubenav/pkg/api"
	"github.com/kubenav/kubenav/pkg/electron"
	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/version"

	"github.com/asticode/go-astikit"
	"github.com/asticode/go-astilectron"
	bootstrap "github.com/asticode/go-astilectron-bootstrap"
	"github.com/elazarl/go-bindata-assetfs"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

var (
	AppName            string
	VersionAstilectron string
	VersionElectron    string
)

var (
	debug      bool
	kubeconfig string
)

type Message struct {
	Event string
	Data  string
}

var messageChannel = make(chan Message)

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

		go func() {
			router := http.NewServeMux()
			api.Register(router)
			electron.Register(router, client)

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

		menuOptions, err := getMenuOptions(client, log)
		if err != nil {
			log.WithError(err).Fatalf("Could not create menu")
		}

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
			Debug:         debug,
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
	Use:   "version",
	Short: "Print version information for kubenav.",
	Long:  "Print version information for kubenav.",
	Run: func(cmd *cobra.Command, args []string) {
		v, err := version.Print("kubenav")
		if err != nil {
			logrus.WithError(err).Fatal("Failed to print version information")
		}

		fmt.Fprintln(os.Stdout, v)
		return
	},
}

func init() {
	rootCmd.AddCommand(versionCmd)

	rootCmd.PersistentFlags().BoolVar(&debug, "debug", false, "Enable debug mode.")
	rootCmd.PersistentFlags().StringVar(&kubeconfig, "kubeconfig", "", "Optional Kubeconfig file.")
}

func main() {
	if err := rootCmd.Execute(); err != nil {
		logrus.WithError(err).Fatal("Failed to initialize kubenav")
	}
}
