
# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# Install curl
RUN apt-get update && apt-get install -y curl

# Copy detect script into the container
#COPY .github/workflows/detect9.sh /usr/local/bin/detect9.sh
# Install curl
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Download the script and place it in /usr/local/bin
RUN curl -L https://detect.synopsys.com/detect9.sh -o /usr/local/bin/detect9.sh && chmod +x /usr/local/bin/detect9.sh


# Make the detect script executable
RUN chmod +x /usr/local/bin/detect9.sh

# Entry point script to run Synopsys Detect
COPY entryFinal.sh /entryFinal.sh
RUN chmod +x /entryFinal.sh

# Set the entrypoint to the detect script
ENTRYPOINT ["/entryFinal.sh"]

##########


#FROM ubuntu:latest

# Install any necessary dependencies and tools for the scanning process
#RUN apt-get update && apt-get install -y curl
#RUN curl -L https://github.com/synopsys-sig/detect-action -o /usr/local/bin/detect-action
#RUN chmod +x /usr/local/bin/detect-action

# Set environment variables for URI and token
#ENV BLACKDUCK_URL=BLACKDUCK_URL
#ENV BLACKDUCK_API_TOKEN=BLACKDUCK_API_TOKEN

# Set the default command to run when the container starts
#CMD ["detect-action", "scan", "--uri", "$BLACKDUCK_URL", "--token", "$BLACKDUCK_API_TOKEN"]

