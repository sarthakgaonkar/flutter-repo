# Environment to install Flutter and build web
FROM debian:latest AS build-env

# Install all needed stuff
RUN apt-get update && \
    apt-get install -y curl git unzip

# Define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG APP=/app/

# Clone Flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
# Change dir to current Flutter folder
RUN cd $FLUTTER_SDK && git fetch && git checkout stable

# Setup the Flutter path as an environmental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Start to run Flutter commands
# Doctor to see if all was installed ok
RUN flutter doctor -v

# Create folder to copy source code
RUN mkdir $APP
# Copy source code to folder
COPY . $APP
# Setup new folder as the working directory
WORKDIR $APP

# Run build: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean
RUN flutter pub get
RUN flutter build web

# Once here the app will be compiled and ready to deploy

# Use nginx to deploy
FROM nginx:1.25.2-alpine

# Copy the info of the builded web app to nginx
COPY --from=build-env /app/build/web /usr/share/nginx/html
