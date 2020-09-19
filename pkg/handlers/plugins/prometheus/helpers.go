package prometheus

import (
	"bytes"
	"text/template"
)

// appendIfMissing appends a value to a slice, when this values doesn't exist in the slice already.
func appendIfMissing(items []string, item string) []string {
	for _, ele := range items {
		if ele == item {
			return items
		}
	}

	return append(items, item)
}

// valueExists checks if an value exists in a slice. When the value exists the function returns true, if not it will
// return false.
func valueExists(items []string, item string) bool {
	for _, ele := range items {
		if ele == item {
			return true
		}
	}

	return false
}

// queryInterpolation is used to replace variables in a query.
func queryInterpolation(query string, variables map[string]string) (string, error) {
	tpl, err := template.New("query").Parse(query)
	if err != nil {
		return "", err
	}

	var buf bytes.Buffer
	err = tpl.Execute(&buf, variables)
	if err != nil {
		return "", err
	}

	return buf.String(), nil
}
