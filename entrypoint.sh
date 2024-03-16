#!/usr/bin/env bash

if [ ! -z $INPUT_USERNAME ];
then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
fi

echo $INPUT_WORKSPACE

#exec docker run -v "/var/run/docker.sock":"/var/run/docker.sock" $INPUT_OPTIONS --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
exec docker run -v "/var/run/docker.sock":"/var/run/docker.sock" -v $INPUT_WORKSPACE:/work --entrypoint=bash $INPUT_IMAGE -c "cd /work; tiecd ${INPUT_ARGS//$'\n'/;}"
