#!/usr/bin/env bash

#if [ ! -z $INPUT_USERNAME ];
#then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
#fi
#
#if [ ! -z $INPUT_DOCKER_NETWORK ];
#then INPUT_OPTIONS="$INPUT_OPTIONS --network $INPUT_DOCKER_NETWORK"
#fi

ls -al /
INPUT_RUN="pwd; ls -al / ; tiecd deploy"
echo Using image: $INPUT_VERSION
exec docker run --rm -v "/var/run/docker.sock":"/var/run/docker.sock"  --entrypoint=bash ghcr.io/dataaxiom/tiecd:$INPUT_VERSION -c "${INPUT_RUN//$'\n'/;}"
#exec docker run --rm -v "/var/run/docker.sock":"/var/run/docker.sock" -v "$(pwd)":"/scratch"  --entrypoint=bash ghcr.io/dataaxiom/tiecd:$INPUT_VERSION -c "${INPUT_RUN//$'\n'/;}"
