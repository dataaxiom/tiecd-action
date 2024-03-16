#!/bin/bash

docker pull ghcr.io/dataaxiom/tiecd:main-k8s
docker run --rm ghcr.io/dataaxiom/tiecd:main-k8s tiecd --help
