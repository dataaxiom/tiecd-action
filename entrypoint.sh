#!/usr/bin/env bash

if [ ! -z $INPUT_USERNAME ];
then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
fi

if [ ! -z $INPUT_DOCKER_NETWORK ];
then INPUT_OPTIONS="$INPUT_OPTIONS --network $INPUT_DOCKER_NETWORK"
fi

echo $INPUT_ROHAN
IMAGE=ghcr.io/dataaxiom/tiecd:$INPUT_IMAGE
exec docker run --rm -v "/var/run/docker.sock":"/var/run/docker.sock" $INPUT_WORKSPACE --entrypoint=bash $IMAGE -c "cd /scratch; ls -al; ${INPUT_RUN//$'\n'/;}"
