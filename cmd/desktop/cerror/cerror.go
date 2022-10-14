package cerror

import (
	"fmt"
	"strings"
)

// New returns a new error string, which can be returned by a function to interop with the c code.
func New(err error) string {
	return fmt.Sprintf("{\"error\": \"%s\"}", strings.ReplaceAll(err.Error(), "\"", "'"))
}
