package plugins

import (
	"github.com/mitchellh/mapstructure"
)

// mapToStruct converts the map from a plugin request which can contain additional data, to a struct.
func mapToStruct(request map[string]interface{}, result interface{}) error {
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
