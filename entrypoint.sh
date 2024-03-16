#!/usr/bin/env bash

#if [ ! -z $INPUT_USERNAME ];
#then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
#fi
#
#if [ ! -z $INPUT_DOCKER_NETWORK ];
#then INPUT_OPTIONS="$INPUT_OPTIONS --network $INPUT_DOCKER_NETWORK"
#fi
INPUT_RUN="tiecd --help"
exec docker run -v "/var/run/docker.sock":"/var/run/docker.sock" ghcr.io/dataaxiom/tiecd:$INPUT_version -c "${INPUT_RUN//$'\n'/;}"