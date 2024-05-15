#!/bin/bash
set -e

detect9 --blackduck.url="${BLACKDUCK_URL}" \
       --blackduck.api.token="${BLACKDUCK_API_TOKEN}" \
       "$@"
