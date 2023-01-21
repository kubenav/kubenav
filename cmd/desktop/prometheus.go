package main

// #include <stdlib.h>
// #include "stdint.h"
import "C"

import (
	"github.com/kubenav/kubenav/cmd/desktop/cerror"
	"github.com/kubenav/kubenav/cmd/desktop/dart_api_dl"
	"github.com/kubenav/kubenav/pkg/shared"
)

// PrometheusGetData returns metrics for a list of PromQL queries.
//
//export PrometheusGetData
func PrometheusGetData(port C.int64_t, contextNameC *C.char, contextNameLen C.int, proxyC *C.char, proxyLen C.int, timeout C.int64_t, requestC *C.char, requestLen C.int) {
	contextName := C.GoStringN(contextNameC, contextNameLen)
	proxy := C.GoStringN(proxyC, proxyLen)
	request := C.GoStringN(requestC, requestLen)

	go prometheusGetData(int64(port), contextName, proxy, int64(timeout), request)
}

func prometheusGetData(port int64, contextName, proxy string, timeout int64, request string) {
	restConfig, clientset, err := kubeClient.GetClient(contextName, "", "", false, "", "", "", "", "", proxy, timeout)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	metrics, err := shared.PrometheusGetData(restConfig, clientset, request)
	if err != nil {
		dart_api_dl.SendToPort(port, cerror.New(err))
		return
	}

	dart_api_dl.SendToPort(port, metrics)
}
