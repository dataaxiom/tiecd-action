#!/usr/bin/env bash

#TODO support private repos
if [ ! -z $INPUT_USERNAME ];
then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
fi

if [[ $INPUT_IMAGE == *"/"* ]]; then
  IMAGE=$INPUT_IMAGE
else
  IMAGE=ghcr.io/dataaxiom/tiecd:$INPUT_IMAGE
fi
exec docker run --rm -v "/var/run/docker.sock":"/var/run/docker.sock" $INPUT_OPTIONS --entrypoint=bash $IMAGE -c "cd /work; ${INPUT_RUN//$'\n'/;}"
