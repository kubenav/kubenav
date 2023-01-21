package main

// #include <stdlib.h>
// #include "stdint.h"
import "C"

import (
	"github.com/kubenav/kubenav/cmd/desktop/cerror"
	"github.com/kubenav/kubenav/cmd/desktop/dart_api_dl"
	"github.com/kubenav/kubenav/pkg/shared"
)

// PrettifyYAML takes a json string as argument and returns a prettified yaml string. For that we have to unmarshal the
// json string into a map[string]interface{} which we can then marshal to the prettified yaml string.
//
//export PrettifyYAML
func PrettifyYAML(port C.int64_t, jsonStrC *C.char, jsonStrLen C.int) {
	jsonStr := C.GoStringN(jsonStrC, jsonStrLen)
	go prettifyYAML(int64(port), jsonStr)
}

func prettifyYAML(port int64, jsonStr string) {
	yaml, err := shared.PrettifyYAML(jsonStr)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, yaml)
}

// CreateJSONPatch creates a path for two given json strings. This is needed when a user edits a resource, where the
// source argument is the manifest of the current resource and the target is the edited manifest. The returned patch
// can then be send to the Kubernetes API to edit the resource.
//
//export CreateJSONPatch
func CreateJSONPatch(port C.int64_t, sourceC *C.char, sourceLen C.int, targetC *C.char, targetLen C.int) {
	source := C.GoStringN(sourceC, sourceLen)
	target := C.GoStringN(targetC, targetLen)

	go createJSONPatch(int64(port), source, target)
}

func createJSONPatch(port int64, source, target string) {
	patch, err := shared.CreateJSONPatch(source, target)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, patch)
}
