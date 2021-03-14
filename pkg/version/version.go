package version

import (
	"bytes"
	"runtime"
	"strings"
	"text/template"

	log "github.com/sirupsen/logrus"
)

// Build information. Populated at build-time.
var (
	Version   string
	Revision  string
	Branch    string
	BuildUser string
	BuildDate string
	GoVersion = runtime.Version()
)

// versionInfoTmpl contains the template used by Print.
var versionInfoTmpl = `
{{.program}}, version {{.version}} (branch: {{.branch}}, revision: {{.revision}})
  build user:       {{.buildUser}}
  build date:       {{.buildDate}}
  go version:       {{.goVersion}}
`

// Print returns version information.
func Print(program string) (string, error) {
	m := map[string]string{
		"program":   program,
		"version":   Version,
		"revision":  Revision,
		"branch":    Branch,
		"buildUser": BuildUser,
		"buildDate": BuildDate,
		"goVersion": GoVersion,
	}
	t, err := template.New("version").Parse(versionInfoTmpl)
	if err != nil {
		return "", err
	}

	var buf bytes.Buffer
	if err := t.ExecuteTemplate(&buf, "version", m); err != nil {
		return "", err
	}
	return strings.TrimSpace(buf.String()), nil
}

// Info returns version, branch and revision information.
func Info() log.Fields {
	return log.Fields{"version": Version, "branch": Branch, "revision": Revision}
}

// BuildContext returns goVersion, buildUser and buildDate information.
func BuildContext() log.Fields {
	return log.Fields{"go": GoVersion, "user": BuildUser, "date": BuildDate}
}
