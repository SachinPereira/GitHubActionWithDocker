# Dockerfile

# Use the official nginx image as the base image
FROM nginx:latest

# Copy the index.html file into the nginx web root directory
COPY index.html /usr/share/nginx/html/index.html
