package main

import (
	"github.com/kubenav/kubenav/cmd/mobile"
	"github.com/kubenav/kubenav/pkg/version"

	log "github.com/sirupsen/logrus"
)

func main() {
	logLevel := log.InfoLevel

	log.SetLevel(logLevel)
	log.WithFields(version.Info()).Infof("Version information")
	log.WithFields(version.BuildContext()).Infof("Build context")

	mobile.StartServer()
}
