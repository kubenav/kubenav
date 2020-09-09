// Package helpers implements some useful function which are shared between multiple plugins.
package helpers

import (
	"github.com/mitchellh/mapstructure"
)

// MapToStruct converts the map from a plugin request which can contain additional data, to a struct.
func MapToStruct(request map[string]interface{}, result interface{}) error {
	cfg := &mapstructure.DecoderConfig{
		Metadata: nil,
		Result:   result,
		TagName:  "json",
	}

	decoder, err := mapstructure.NewDecoder(cfg)
	if err != nil {
		return err
	}

	err = decoder.Decode(request)
	if err != nil {
		return err
	}

	return nil
}
