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

## pass INPUT env variables through
ARGS=$INPUT_OPTIONS
while IFS='=' read -r -d '' n v; do
    printf "'%s'='%s'\n" "$n" "$v"
    if [[ $n == INPUT* ]]; then
       ARGS="$ARGS -e $n=$v"
    fi
done < <(env -0)

echo "rohan"
echo $ARGS
echo "rohan"

exec docker run --rm -v "/var/run/docker.sock":"/var/run/docker.sock" $ARGS --entrypoint=bash $IMAGE -c "cd /work; ${INPUT_RUN//$'\n'/;}"
