#!/usr/bin/env bash

#if [ ! -z $INPUT_USERNAME ];
#then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
#fi
#
#if [ ! -z $INPUT_DOCKER_NETWORK ];
#then INPUT_OPTIONS="$INPUT_OPTIONS --network $INPUT_DOCKER_NETWORK"
#fi
INPUT_RUN="tiecd deploy"
echo Using image: $INPUT_VERSION
ls -al
exec docker run --rm -v "/var/run/docker.sock":"/var/run/docker.sock" ghcr.io/dataaxiom/tiecd:$INPUT_VERSION $INPUT_RUN
