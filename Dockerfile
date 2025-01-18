FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y build-essential

# Set the working directory inside the container
WORKDIR /workdir
VOLUME /workdir/build

COPY ./package ./package

ENV PACKAGE_VERSION=1.0.0

# Command to build the package
CMD dpkg-deb --build package "./build/turntable2sonos-${PACKAGE_VERSION}.deb"