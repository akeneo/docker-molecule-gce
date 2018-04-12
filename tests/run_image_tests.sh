set -euo pipefail

DID_FAIL=0
IMAGE_TAG=$1

CURRENT_DIR=$(dirname $(readlink -f $0))

for TEST in $(ls -1 ${CURRENT_DIR}/${IMAGE_TAG}/*.sh 2> /dev/null || true); do
    docker run -i -t -v ${TEST}:/tmp/test.sh --name molecule akeneo/ansible-molecule-gce:${IMAGE_TAG} || DID_FAIL=1
    docker exec -it molecule bash /tmp/test.sh
    docker stop molecule
    docker rm molecule
done

test "0" -ne "$DID_FAIL" && exit 1

exit 0