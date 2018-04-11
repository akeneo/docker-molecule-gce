echo "Molecule version should be 2.12.0"

VERSION=$(molecule --version | grep "^molecule, version 2.12.0")

if [ -z "$VERSION" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0