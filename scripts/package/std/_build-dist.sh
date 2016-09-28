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

echo "project root is ${ROOT}"

PUSH=${PUSH:-false}
CACHE=""

# this is Java/Maven specific speed up, more to come
if [ -n "$ENABLE_MAVEN_CACHE" ]; then
  echo "enabling maven cache"
  CACHE=" -v `cd ~/.m2 ; pwd`:/root/.m2 "
fi

if [ -n "$DIST_IMAGE_BASE" ]; then
  if [ "$1" == "" ]; then
    echo 'Error: Provide base dependencies rev as first param to this script'
    exit 1
  fi

  DEPS_REV="$1"
  echo "deps rev: $DEPS_REV"

  set +e
  docker pull ${AS_DOCKER_REGISTRY}$DIST_IMAGE_BASE:$DEPS_REV
  baseimage_pull=$?
  set -e
  if [ "${baseimage_pull}" != "0" ]; then
    # build the base image
    echo "building base image ${AS_DOCKER_REGISTRY}$DIST_IMAGE_BASE:$DEPS_REV"
    LOCAL_TAG=$(date +"%s")
    docker build -f $DOCKER_SCRIPTS/Dockerfile.dist.base -t $LOCAL_TAG $ROOT
    CONTAINER_ID=run_$LOCAL_TAG
    echo "updating base image in container $CONTAINER_ID"
    docker run $CACHE --name $CONTAINER_ID $LOCAL_TAG
    echo "snapshotting $CONTAINER_ID to image ${AS_DOCKER_REGISTRY}$DIST_IMAGE_BASE:$DEPS_REV"
    docker commit $CONTAINER_ID ${AS_DOCKER_REGISTRY}$DIST_IMAGE_BASE:$DEPS_REV
    docker rm -f $CONTAINER_ID
    $PUSH && echo "pushing image ${AS_DOCKER_REGISTRY}$DIST_IMAGE_BASE:$DEPS_REV to central registry"
    $PUSH && docker push ${AS_DOCKER_REGISTRY}$DIST_IMAGE_BASE:$DEPS_REV
  fi
  sed "s/\$DEPS_REV/${DEPS_REV}/g; s/\$DIST_IMAGE_BASE/${DIST_IMAGE_BASE}/g" $DOCKER_SCRIPTS/Dockerfile.dist > $ROOT/Dockerfile_app
else
  cp $DOCKER_SCRIPTS/Dockerfile.dist $ROOT/Dockerfile_app
fi

DIST=$(date +"%s")
echo "now building dist container $DIST_IMAGE:$DIST"
docker build -f $ROOT/Dockerfile_app -t $DIST_IMAGE:$DIST $ROOT
rm -rf $ROOT/dist || true
mkdir -p $ROOT/dist
echo "now running dist container $DIST_IMAGE:$DIST"
DIST_ID="dist_builder_$(date +"%s")"
docker run -t --name $DIST_ID -e BUILDID=${BUILD_REVISION} $CACHE $DIST_IMAGE:$DIST
docker cp $DIST_ID:/app/dist/. $ROOT/dist
docker rm $DIST_ID
docker rmi $DIST_IMAGE:$DIST