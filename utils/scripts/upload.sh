#!/bin/bash

# Upload script from https://github.com/JasonEtco/upload-to-release
# with some small adjustments for macOS.

set -e
set -o pipefail

# Ensure that the GITHUB_TOKEN secret is included
if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN env variable."
  exit 1
fi

# Ensure that the file path is present
if [[ -z "$1" ]]; then
  echo "You must pass at least one argument to this action, the path to the file to upload."
  exit 1
fi

# Only upload to non-draft releases
IS_DRAFT=$(jq --raw-output '.release.draft' $GITHUB_EVENT_PATH)
if [ "$IS_DRAFT" = true ]; then
  echo "This is a draft, so nothing to do!"
  exit 0
fi

# Prepare the headers
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"
CONTENT_LENGTH_HEADER="Content-Length: $(find ${1} -type f -exec ls -l {} \; | awk '{sum += $5} END {print sum}')"
CONTENT_TYPE_HEADER="Content-Type: ${2}"

# Build the Upload URL from the various pieces
RELEASE_ID=$(jq --raw-output '.release.id' $GITHUB_EVENT_PATH)
if [[ -z "${RELEASE_ID}" ]]; then
  echo "There was no release ID in the GitHub event. Are you using the release event type?"
  exit 1
fi

FILENAME=$(basename $1)
UPLOAD_URL="https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${RELEASE_ID}/assets?name=${FILENAME}"
echo "$UPLOAD_URL"

# Upload the file
curl \
  -sSL \
  -XPOST \
  -H "${AUTH_HEADER}" \
  -H "${CONTENT_LENGTH_HEADER}" \
  -H "${CONTENT_TYPE_HEADER}" \
  --upload-file "${1}" \
  "${UPLOAD_URL}"
