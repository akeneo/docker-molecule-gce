#!/usr/bin/env bash

set -euo pipefail

DID_FAIL=0

PROJECT_DIR=$(dirname $(readlink -f $0))/..

docker inspect akeneo/ansible-molecule-gce:${IMAGE_TAG} > /dev/null

echo "Run tests for akeneo/ansible-molecule-gce:$IMAGE_TAG image"

bash ${PROJECT_DIR}/tests/run_image_tests.sh ${IMAGE_TAG} || DID_FAIL=1

test "0" -ne "$DID_FAIL" && exit 1

exit 0