#!/bin/bash

# Ensure JAVA_HOME is set correctly
export JAVA_HOME=/usr/local/openjdk-11
export PATH=$JAVA_HOME/bin:$PATH

# Define the path to the detect jar file
DETECT_JAR_PATH="/github/home/synopsys-detect/download/synopsys-detect-9.6.0.jar"

# Ensure the directory exists
mkdir -p /github/home/synopsys-detect/download

# Download the detect jar file if it does not exist
if [ ! -f "$DETECT_JAR_PATH" ]; then
    echo "Downloading Synopsys Detect jar file..."
    curl -L -o "$DETECT_JAR_PATH" https://sig-repo.synopsys.com/artifactory/bds-integrations-release/com/synopsys/integration/synopsys-detect/9.6.0/synopsys-detect-9.6.0.jar
fi


# Set default value for DETECT_TOOLS_EXCLUDED
DETECT_TOOLS_EXCLUDED=${DETECT_TOOLS_EXCLUDED:-SIGNATURE_SCAN}

# Run the detect script with excluded tools environment variable and capture output in JSON format
exec /usr/local/bin/detect9.sh "$@" --detect.tools.excluded="$DETECT_TOOLS_EXCLUDED"
