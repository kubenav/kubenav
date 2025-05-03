package middleware

import (
	"encoding/json"
	"net/http"
)

// Error represents the structure of an error message.
type Error struct {
	Error   bool   `json:"error"`
	Code    int    `json:"statusCode"`
	Message string `json:"message"`
}

// Errorf return an new error response.
func Errorf(w http.ResponseWriter, r *http.Request, err error, code int, message string) {
	errorMessage := Error{
		Error:   true,
		Code:    code,
		Message: message,
	}

	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(code)
	json.NewEncoder(w).Encode(&errorMessage)
}

// Write return a new json response.
func Write(w http.ResponseWriter, r *http.Request, data interface{}) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(&data)
}
