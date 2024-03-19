#Stage 1 - Install dependencies and build the app in a build environment
FROM debian:latest AS build-env
# Install flutter dependencies
RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 sed
RUN  curl https://storage.googleapis.com/flutter_infra_release/flutter/f11015e14d2432864d50b33a4dc939e6a4f151f3/dart-sdk-linux-x64.zip
RUN apt-get clean
# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
# Set flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"
# Run flutter doctor
RUN flutter doctor -v
RUN flutter channel master
RUN flutter upgrade
# Copy files to container and build
RUN mkdir /app/
# COPY pubspec.yaml /app/
# RUN flutter pub get 
COPY . /app/
WORKDIR /app/
RUN flutter build web
# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
