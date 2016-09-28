#!/bin/bash

set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source "$DIR/_settings.sh"

echo "deps rev: $DEPS_REV"

mkdir -p ${ROOT}/dist ; rm -rf ${ROOT}/dist ; mkdir -p ${ROOT}/dist
cp -r ${ROOT}/source ${ROOT}/dist
cp ${ROOT}/Gemfile* ${ROOT}/dist
cp ${ROOT}/config.rb ${ROOT}/dist
cp -r ${ROOT}/lib ${ROOT}/dist

