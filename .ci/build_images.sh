#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR=$(dirname $(readlink -f $0))/..

docker build -t akeneo/molecule-gce:${IMAGE_TAG} ${PROJECT_DIR}/${IMAGE_TAG}
