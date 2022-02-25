package kubenav

import (
	"encoding/json"

	"sigs.k8s.io/yaml"
)

// PrettifyYAML takes a json string as argument and returns a prettified yaml string. For that we have to unmarshal the
// json string into a map[string]interface{} which we can then marshal to the prettified yaml string.
func PrettifyYAML(jsonStr string) (string, error) {
	var jsonObj map[string]interface{}

	err := json.Unmarshal([]byte(jsonStr), &jsonObj)
	if err != nil {
		return "", err
	}

	yamlStr, err := yaml.Marshal(jsonObj)
	if err != nil {
		return "", err
	}

	return string(yamlStr), nil
}
