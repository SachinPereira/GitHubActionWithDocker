#!/bin/sh

# Run Synopsys Detect with your desired options
chmod +x /synopsys-detect/detect9.sh
/synopsys-detect/detect9.sh --blackduck.url="${BLACKDUCK_URL}" --blackduck.api.token="${BLACKDUCK_API_TOKEN}"
