set -euo pipefail

DID_FAIL=0
IMAGE_TAG=$1

CURRENT_DIR=$(dirname $(readlink -f $0))

for TEST in $(ls -1 ${CURRENT_DIR}/${IMAGE_TAG}/*.sh 2> /dev/null || true); do
    docker run -i -t --rm -v ${TEST}:/tmp/test.sh akeneo/molecule-gce:${IMAGE_TAG} bash /tmp/test.sh || DID_FAIL=1
done

test "0" -ne "$DID_FAIL" && exit 1

exit 0