package server

import (
  "net/http"

  "github.com/kubenav/kubenav/pkg/api"
)

func StartServer() {
  router := http.NewServeMux()

  api.Register(router)

  if err := http.ListenAndServe(":14122", router); err != nil {
    return
  }
}
