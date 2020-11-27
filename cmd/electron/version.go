package main

import (
	"encoding/json"
	"net/http"
	"time"

	log "github.com/sirupsen/logrus"
)

type Release struct {
	TagName string `json:"tag_name"`
}

// checkVersion compares the given version string, which is set during the build time with the latest version tag from
// GitHub. If the tags differ the function returns true. In case of an error or if the tags are equal the function
// returns false.
// NOTE: This only works for the official releases. If a beta version is used this function always returns true, also
// when the beta release is newer then the last production release.
func checkVersion(currentVersion string) bool {
	client := &http.Client{
		Timeout: 5 * time.Second,
	}

	req, err := http.NewRequest("GET", "https://api.github.com/repos/kubenav/kubenav/releases/latest", nil)
	if err != nil {
		log.WithError(err).Errorf("Could not create GitHub release request")
		return false
	}

	resp, err := client.Do(req)
	if err != nil {
		log.WithError(err).Errorf("Could not do GitHub release request")
		return false
	}

	defer resp.Body.Close()

	var release Release
	err = json.NewDecoder(resp.Body).Decode(&release)
	if err != nil {
		log.WithError(err).Errorf("Could not decode GitHub response body")
		return false
	}

	log.Infof("Version Check: Current %s, Available %s", currentVersion, release.TagName)

	if release.TagName != currentVersion {
		return true
	}

	return false
}
