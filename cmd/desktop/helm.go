package main

// #include <stdlib.h>
// #include "stdint.h"
import "C"

import (
	"github.com/kubenav/kubenav/cmd/desktop/cerror"
	"github.com/kubenav/kubenav/cmd/desktop/dart_api_dl"
	"github.com/kubenav/kubenav/pkg/shared"
)

// HelmListCharts returns a list of Helm charts for the given cluster and namespace. If an error occures during the
// process the error is returned.
//
//export HelmListCharts
func HelmListCharts(port C.int64_t, contextNameC *C.char, contextNameLen C.int, proxyC *C.char, proxyLen C.int, timeout C.int64_t, namespaceC *C.char, namespaceLen C.int) {
	contextName := C.GoStringN(contextNameC, contextNameLen)
	proxy := C.GoStringN(proxyC, proxyLen)
	namespace := C.GoStringN(namespaceC, namespaceLen)

	go helmListCharts(int64(port), contextName, proxy, int64(timeout), namespace)
}

func helmListCharts(port int64, contextName, proxy string, timeout int64, namespace string) {
	_, clientset, err := kubeClient.GetClient(contextName, "", "", false, "", "", "", "", "", proxy, timeout)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	list, err := shared.HelmListCharts(clientset, namespace)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, list)
}

// HelmGetChart returns a single of Helm chart. The Helm chart is identified by it's namespace, name and version. If an
// error occures during the process the error is returned.
//
//export HelmGetChart
func HelmGetChart(port C.int64_t, contextNameC *C.char, contextNameLen C.int, proxyC *C.char, proxyLen C.int, timeout C.int64_t, namespaceC *C.char, namespaceLen C.int, nameC *C.char, nameLen C.int, versionC C.int64_t) {
	contextName := C.GoStringN(contextNameC, contextNameLen)
	proxy := C.GoStringN(proxyC, proxyLen)
	namespace := C.GoStringN(namespaceC, namespaceLen)
	name := C.GoStringN(nameC, nameLen)

	go helmGetChart(int64(port), contextName, proxy, int64(timeout), namespace, name, int64(versionC))
}

func helmGetChart(port int64, contextName, proxy string, timeout int64, namespace, name string, version int64) {
	_, clientset, err := kubeClient.GetClient(contextName, "", "", false, "", "", "", "", "", proxy, timeout)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	chart, err := shared.HelmGetChart(clientset, namespace, name, version)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, chart)
}

// HelmGetHistory returns the History of a Helm chart. The Helm chart is identified by it's namespace and name. If an
// error occures during the process the error is returned.
//
//export HelmGetHistory
func HelmGetHistory(port C.int64_t, contextNameC *C.char, contextNameLen C.int, proxyC *C.char, proxyLen C.int, timeout C.int64_t, namespaceC *C.char, namespaceLen C.int, nameC *C.char, nameLen C.int) {
	contextName := C.GoStringN(contextNameC, contextNameLen)
	proxy := C.GoStringN(proxyC, proxyLen)
	namespace := C.GoStringN(namespaceC, namespaceLen)
	name := C.GoStringN(nameC, nameLen)

	go helmGetHistory(int64(port), contextName, proxy, int64(timeout), namespace, name)
}

func helmGetHistory(port int64, contextName, proxy string, timeout int64, namespace, name string) {
	_, clientset, err := kubeClient.GetClient(contextName, "", "", false, "", "", "", "", "", proxy, timeout)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	history, err := shared.HelmGetHistory(clientset, namespace, name)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, history)
}
