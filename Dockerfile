# Use an appropriate base image with Java 11 installed
FROM adoptopenjdk:11-jdk-hotspot

# Set environment variables
ENV DETECT_VERSION=7.9.0
ENV BLACKDUCK_URL=<your_blackduck_url>
ENV BLACKDUCK_API_TOKEN=<your_blackduck_api_token>
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    update-ca-certificates

# Download and install Synopsys Detect
RUN curl -O https://detect.synopsys.com/download/synopsys-detect-${DETECT_VERSION}.jar

# Entry point script to run Synopsys Detect
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
