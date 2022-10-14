package main

// #include <stdlib.h>
import "C"

import (
	"unsafe"

	"github.com/kubenav/kubenav/cmd/desktop/dart_api_dl"
	"github.com/kubenav/kubenav/pkg/kube"
	"github.com/kubenav/kubenav/pkg/kube/desktop"

	_ "k8s.io/client-go/plugin/pkg/client/auth"
)

var kubeClient kube.Client

// FreePointer can be used to free a returned pointer.
//
//export FreePointer
func FreePointer(ptr *C.char) {
	C.free(unsafe.Pointer(ptr))
}

// Init initializes our Kubernetes client, which is needed to interact with the Kubernetes API.
//
//export Init
func Init(api unsafe.Pointer) {
	dart_api_dl.Init(api)
	kubeClient = kube.NewClient(desktop.Platform)
}

func main() {}
