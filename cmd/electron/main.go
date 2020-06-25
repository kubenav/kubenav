package main

import (
	"bufio"
	"flag"
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
	_ "k8s.io/client-go/plugin/pkg/client/auth"
)

var (
	AppName            string
	VersionAstilectron string
	VersionElectron    string
)

var (
	fs                    = flag.NewFlagSet(os.Args[0], flag.ContinueOnError)
	debugFlag             = fs.Bool("debug", false, "Enable debug mode.")
	kubeconfigFlag        = fs.String("kubeconfig", "", "Optional Kubeconfig file.")
	kubeconfigIncludeFlag = fs.String("kubeconfig-include", "", "Comma separated list of globs to include in the Kubeconfig.")
	kubeconfigExcludeFlag = fs.String("kubeconfig-exclude", "", "Comma separated list of globs to exclude from the Kubeconfig. This flag must be used in combination with the '-kubeconfig-include' flag.")
	syncFlag              = fs.Bool("sync", false, "Sync the changes from kubenav with the used Kubeconfig file.")
)

// Message is the structure of a Server Sent Event, which contains the Event and Data. Server Sent Events are used to
// send actions from the Electron menu to the frontend.
type Message struct {
	Event string
	Data  string
}

var messageChannel = make(chan Message)

func main() {
	// Parse command-line flags.
	fs.Parse(os.Args[1:])

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
	client, err := kube.NewClient(false, *kubeconfigFlag, *kubeconfigIncludeFlag, *kubeconfigExcludeFlag)
	if err != nil {
		log.WithError(err).Fatalf("Could not create Kubernetes client")
	}

	// Register the API routes for the Electron app. Additional to the devserver we need another rout to handle the
	// communication between the Electron menu and the frontend via Server Sent Events. We also have to serve the
	// frontend from the embedded assets.
	go func() {
		router := http.NewServeMux()
		electron.Register(router, *syncFlag, client)

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
		Debug:         *debugFlag,
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
}
