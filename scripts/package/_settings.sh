#!/bin/bash

export APP="as-slate"
export DIST_IMAGE="${APP}-dist"
export DIST_IMAGE_BASE="${DIST_IMAGE}-base"
export DIST_PREPARE_SCRIPT="$DIR/_copy_to_dist.sh"
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export ROOT="`cd "${DIR}/../.."; pwd`"

source "$DIR/std/_hash-funcs.sh"

PACKAGES_REV=$(hashFile $ROOT/Gemfile)
PACKAGES2_REV=$(hashFile $ROOT/Gemfile.lock)
SCRIPTS_REV=$(hashDir $ROOT/scripts/build)
export DEPS_REV=$(hashStr $PACKAGES_REV $PACKAGES2_REV $SCRIPTS_REV)
