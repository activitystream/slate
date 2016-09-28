#!/bin/bash

set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source "$DIR/_settings.sh"

printf "\nBuilding image $APP:$1 \n\n"
$DIR/std/_build-image.sh $@
