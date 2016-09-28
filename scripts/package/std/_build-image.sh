#!/bin/bash

##################################
#
#   This is a generic script, it knows nothing about your project and can be replaced at any point with no warning
#   The script that does know about your project is same as this name no leading underscore
#   In general if a script name starts with an underscore, it is a 'library' script that should not be ran
#
##################################

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DOCKER_SCRIPTS="$ROOT/scripts/package/docker"
AS_DOCKER_REGISTRY=registry.activitystream.com:5043/
PUSH=${PUSH:-false}

echo "project root is ${ROOT}"

if [ "$1" == "" ]; then
    echo 'Error: Provide as a first and only argument revsion tag for the docker image of this app'
    exit 1
fi

export PACK="$ROOT/.tmp/dist/$(date +"%s")"
rm -rf $ROOT/.tmp/dist || true
echo "Packaging in $PACK"
mkdir -p $PACK
echo "launching $DIST_PREPARE_SCRIPT"
$DIST_PREPARE_SCRIPT
cp $DOCKER_SCRIPTS/Dockerfile.image $PACK/Dockerfile

echo "now building image ${AS_DOCKER_REGISTRY}$APP:$1"
docker build -t ${AS_DOCKER_REGISTRY}$APP:$1 -t ${AS_DOCKER_REGISTRY}$APP:latest $PACK
$PUSH && echo "now pushing it to registry $AS_DOCKER_REGISTRY"
$PUSH && docker push ${AS_DOCKER_REGISTRY}$APP:$1
$PUSH && docker push ${AS_DOCKER_REGISTRY}$APP:latest
echo "done"
