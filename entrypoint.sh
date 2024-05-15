#!/bin/bash
set -e

detect --blackduck.url="${BLACKDUCK_URL}" \
       --blackduck.api.token="${BLACKDUCK_API_TOKEN}" \
       "$@"
