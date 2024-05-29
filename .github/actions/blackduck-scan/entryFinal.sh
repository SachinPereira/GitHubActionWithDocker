#!/bin/bash

# Ensure JAVA_HOME is set correctly
export JAVA_HOME=/usr/local/openjdk-11
export PATH=$JAVA_HOME/bin:$PATH

# Define the path to the detect jar file
DETECT_JAR_PATH="/opt/synopsys-detect/synopsys-detect-9.6.0.jar"

# Ensure the directory exists
mkdir -p /opt/synopsys-detect

# Download the detect jar file if it does not exist
if [ ! -f "$DETECT_JAR_PATH" ]; then
    echo "Downloading Synopsys Detect jar file..."
    curl -L -o "$DETECT_JAR_PATH" https://sig-repo.synopsys.com/artifactory/bds-integrations-release/com/synopsys/integration/synopsys-detect/9.6.0/synopsys-detect-9.6.0.jar
fi

# Run the Synopsys Detect jar file
java -jar "$DETECT_JAR_PATH" --detect.tools.excluded=SIGNATURE_SCAN
