#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# credits to https://github.com/peter-evans/dockerhub-description/blob/master/entrypoint.sh


README_FILEPATH=${README_FILEPATH:="./README.md"}

echo "Acquiring token"
LOGIN_PAYLOAD="{\"username\": \"${DOCKER_USERNAME}\", \"password\": \"${DOCKER_PASSWORD}\"}"
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST \
      -d ${LOGIN_PAYLOAD} https://hub.docker.com/v2/users/login/ | jq -r .token)


REPO_URL="https://hub.docker.com/v2/repositories/${CONTAINER}/"
echo "Sending PATCH request to ${REPO_URL}"

RESPONSE_CODE=$(curl -s --write-out %{response_code} \
          --output /dev/null \
          -H "Authorization: JWT ${TOKEN}" \
          -X PATCH \
          --data-urlencode full_description@${README_FILEPATH} \
          ${REPO_URL})
echo "Received response code: $RESPONSE_CODE"

if [ $RESPONSE_CODE -eq 200 ]; then
  exit 0
else
  exit 1
fi