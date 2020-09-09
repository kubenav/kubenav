// +build tools

// Package tools is used to force Go modules to download and install our dependencies used for our build pipeline.
package tools

import (
	_ "github.com/asticode/go-astilectron-bundler"
	_ "golang.org/x/mobile/cmd/gomobile"
)
