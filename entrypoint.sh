#!/usr/bin/env bash

if [ ! -z $INPUT_USERNAME ];
then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
fi

if [ ! -z $INPUT_DOCKER_NETWORK ];
then INPUT_OPTIONS="$INPUT_OPTIONS --network $INPUT_DOCKER_NETWORK"
fi

set
echo $INPUT_OPTIONS
echo $TIECD_WORKSPACE
echo $INPUT_RUN
IMAGE=ghcr.io/dataaxiom/tiecd:$INPUT_IMAGE
exec docker run -rm -v "/var/run/docker.sock":"/var/run/docker.sock" -v $INPUT_WORKSPACE:/scratch --entrypoint=bash $IMAGE -c "cd /scratch; ${INPUT_RUN//$'\n'/;}"
