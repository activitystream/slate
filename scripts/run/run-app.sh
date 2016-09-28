#!/bin/bash

set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT="${DIR}/../.."
PATH=${ROOT}/node_modules/.bin:${PATH}
cd $ROOT
node provision.js "$@"
