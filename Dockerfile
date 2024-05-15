FROM adoptopenjdk:11-jdk-hotspot

# Set environment variables
ENV BLACKDUCK_URL=<your_blackduck_url>
ENV BLACKDUCK_API_TOKEN=<your_blackduck_api_token>
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    update-ca-certificates

# Download Synopsys Detect script
RUN mkdir -p /synopsys-detect
RUN ls -l /synopsys-detect  # Debugging: List contents of directory
RUN curl -sSL -o /synopsys-detect/detect9.sh https://detect.synopsys.com/detect9.sh
RUN ls -l /synopsys-detect  # Debugging: List contents of directory after download

# Optionally, you can set execute permissions on the downloaded script
# RUN chmod +x /synopsys-detect/detect9.ps1


# Entry point script to run Synopsys Detect
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
