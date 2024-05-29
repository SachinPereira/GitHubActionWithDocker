#!/bin/bash

# Set default value for DETECT_TOOLS_EXCLUDED
DETECT_TOOLS_EXCLUDED=${DETECT_TOOLS_EXCLUDED:-SIGNATURE_SCAN}

# Run the detect script with excluded tools environment variable and capture output in JSON format
exec /usr/local/bin/detect9.sh "$@" --detect.tools.excluded="$DETECT_TOOLS_EXCLUDED"
