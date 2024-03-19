# Stage 1 - Install dependencies and build the app in a build environment
FROM debian:latest AS build-env

# Install required dependencies
RUN apt-get update \
    && apt-get install -y curl git unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 sed \
    && apt-get clean

# Download and extract Dart SDK tarball using curl
RUN curl -fsSL https://dart.dev/get-dart | tar -xz -C /usr/local/

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set Flutter and Dart SDK paths
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/dart-sdk/bin"

# Run flutter doctor
RUN flutter doctor -v
RUN flutter channel master
RUN flutter upgrade

# Create app directory and copy files
RUN mkdir /app/
COPY . /app/
WORKDIR /app/

# Build Flutter web application
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine

# Copy built Flutter web app to Nginx directory
COPY --from=build-env /app/build/web /usr/share/nginx/html
