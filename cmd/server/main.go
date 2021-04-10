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
	"github.com/kubenav/kubenav/pkg/handlers/plugins/elasticsearch"
	"github.com/kubenav/kubenav/pkg/handlers/plugins/jaeger"
	"github.com/kubenav/kubenav/pkg/handlers/plugins/prometheus"
	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/version"

	log "github.com/sirupsen/logrus"
	flag "github.com/spf13/pflag"
	_ "k8s.io/client-go/plugin/pkg/client/auth"
)

var (
	fs                                  = flag.NewFlagSet(os.Args[0], flag.ContinueOnError)
	debugFlag                           bool
	debugIonicFlag                      string
	inclusterFlag                       bool
	kubeconfigFlag                      string
	pluginElasticsearchAddressFlag      string
	pluginElasticsearchEnabledFlag      bool
	pluginElasticsearchPasswordFlag     string
	pluginElasticsearchUsernameFlag     string
	pluginJaegerAddressFlag             string
	pluginJaegerEnabledFlag             bool
	pluginJaegerPasswordFlag            string
	pluginJaegerUsernameFlag            string
	pluginPrometheusAddressFlag         string
	pluginPrometheusDashboardsNamespace string
	pluginPrometheusEnabledFlag         bool
	pluginPrometheusPasswordFlag        string
	pluginPrometheusUsernameFlag        string
	showVersion                         bool
)

func init() {
	var defaultPluginPrometheusUsernameFlag string
	if os.Getenv("KUBENAV_PROMETHEUS_USERNAME") == "" {
		defaultPluginPrometheusUsernameFlag = os.Getenv("KUBENAV_PROMETHEUS_USERNAME")
	}

	var defaultPluginPrometheusPasswordFlag string
	if os.Getenv("KUBENAV_PROMETHEUS_PASSWORD") == "" {
		defaultPluginPrometheusPasswordFlag = os.Getenv("KUBENAV_PROMETHEUS_PASSWORD")
	}

	var defaultPluginElasticsearchUsernameFlag string
	if os.Getenv("KUBENAV_ELASTICSEARCH_USERNAME") == "" {
		defaultPluginElasticsearchUsernameFlag = os.Getenv("KUBENAV_ELASTICSEARCH_USERNAME")
	}

	var defaultPluginElasticsearchPasswordFlag string
	if os.Getenv("KUBENAV_ELASTICSEARCH_PASSWORD") == "" {
		defaultPluginElasticsearchPasswordFlag = os.Getenv("KUBENAV_ELASTICSEARCH_PASSWORD")
	}

	var defaultPluginJaegerUsernameFlag string
	if os.Getenv("KUBENAV_JAEGER_USERNAME") == "" {
		defaultPluginJaegerUsernameFlag = os.Getenv("KUBENAV_JAEGER_USERNAME")
	}

	var defaultPluginJaegerPasswordFlag string
	if os.Getenv("KUBENAV_JAEGER_PASSWORD") == "" {
		defaultPluginJaegerPasswordFlag = os.Getenv("KUBENAV_JAEGER_PASSWORD")
	}

	fs.BoolVar(&debugFlag, "debug", false, "Enable debug mode.")
	fs.StringVar(&debugIonicFlag, "debug.ionic", "build", "Path to the Ionic app.")
	fs.BoolVar(&inclusterFlag, "incluster", false, "Use the in cluster configuration.")
	fs.StringVar(&kubeconfigFlag, "kubeconfig", "", "Optional Kubeconfig file.")
	fs.StringVar(&pluginElasticsearchAddressFlag, "plugin.elasticsearch.address", "", "The address for Elasticsearch.")
	fs.BoolVar(&pluginElasticsearchEnabledFlag, "plugin.elasticsearch.enabled", false, "Enable the Elasticsearch plugin.")
	fs.StringVar(&pluginElasticsearchPasswordFlag, "plugin.elasticsearch.password", defaultPluginElasticsearchPasswordFlag, "The password for Elasticsearch.")
	fs.StringVar(&pluginElasticsearchUsernameFlag, "plugin.elasticsearch.username", defaultPluginElasticsearchUsernameFlag, "The username for Elasticsearch.")
	fs.StringVar(&pluginJaegerAddressFlag, "plugin.jaeger.address", "", "The address for Jaeger.")
	fs.BoolVar(&pluginJaegerEnabledFlag, "plugin.jaeger.enabled", false, "Enable the Jaeger plugin.")
	fs.StringVar(&pluginJaegerPasswordFlag, "plugin.jaeger.password", defaultPluginJaegerPasswordFlag, "The password for Jaeger.")
	fs.StringVar(&pluginJaegerUsernameFlag, "plugin.jaeger.username", defaultPluginJaegerUsernameFlag, "The username for Jaeger.")
	fs.StringVar(&pluginPrometheusAddressFlag, "plugin.prometheus.address", "", "The address for Prometheus.")
	fs.StringVar(&pluginPrometheusDashboardsNamespace, "plugin.prometheus.dashboards-namespace", "kubenav", "The namespace, where kubenav should look for dashboards.")
	fs.BoolVar(&pluginPrometheusEnabledFlag, "plugin.prometheus.enabled", false, "Enable the Prometheus plugin.")
	fs.StringVar(&pluginPrometheusPasswordFlag, "plugin.prometheus.password", defaultPluginPrometheusPasswordFlag, "The password for Prometheus.")
	fs.StringVar(&pluginPrometheusUsernameFlag, "plugin.prometheus.username", defaultPluginPrometheusUsernameFlag, "The username for Prometheus.")
	fs.BoolVar(&showVersion, "version", false, "Print version information.")
}

func main() {
	fs.Parse(os.Args[1:])

	// If the version flag is true, we just print the version information for kubenav and then we exit kubenav.
	if showVersion {
		v, err := version.Print("kubenav")
		if err != nil {
			log.WithError(err).Fatalf("Failed to print version information")
		}

		fmt.Fprintln(os.Stdout, v)
		return
	}

	// When the debug flag is set, we have to change the log level to debug. If the flag isn't present we use the info
	// log level.
	logLevel := log.InfoLevel
	if debugFlag {
		logLevel = log.DebugLevel
		log.SetReportCaller(true)
	}

	log.SetLevel(logLevel)
	log.WithFields(version.Info()).Infof("Version information")
	log.WithFields(version.BuildContext()).Infof("Build context")

	kubeClient, err := kube.NewClient(false, inclusterFlag, kubeconfigFlag, "", "")
	if err != nil {
		log.WithError(err).Fatalf("Could not create Kubernetes client")
	}

	router := http.NewServeMux()
	apiClient := api.NewClient(false, &plugins.Config{
		Prometheus: &prometheus.Config{
			Enabled:             pluginPrometheusEnabledFlag,
			Address:             pluginPrometheusAddressFlag,
			Username:            pluginPrometheusUsernameFlag,
			Password:            pluginPrometheusPasswordFlag,
			DashboardsNamespace: pluginPrometheusDashboardsNamespace,
		},
		Elasticsearch: &elasticsearch.Config{
			Enabled:  pluginElasticsearchEnabledFlag,
			Address:  pluginElasticsearchAddressFlag,
			Username: pluginElasticsearchUsernameFlag,
			Password: pluginElasticsearchPasswordFlag,
		},
		Jaeger: &jaeger.Config{
			Enabled:  pluginJaegerEnabledFlag,
			Address:  pluginJaegerAddressFlag,
			Username: pluginJaegerUsernameFlag,
			Password: pluginJaegerPasswordFlag,
		},
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
}
