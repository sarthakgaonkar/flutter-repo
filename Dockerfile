# Environment to install flutter and build web
FROM debian:latest AS build-env

# Install necessary dependencies
RUN apt-get update && apt-get install -y curl git unzip

# Define environment variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG APP=/app/

# Clone latest version of Flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK

# Set Flutter path as an environmental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Start running Flutter commands
# Check Flutter installation
RUN flutter --version

# Create folder to copy source code
RUN mkdir $APP

# Copy source code to the folder
COPY . $APP

# Set the new folder as the working directory
WORKDIR $APP

# Run Flutter commands to build the web app
RUN flutter clean && flutter pub get && flutter build web

# The app is now compiled and ready to deploy

# Use nginx to deploy
FROM nginx:1.25.2-alpine

# Copy the built web app to nginx
COPY --from=build-env $APP/build/web /usr/share/nginx/html
