#!/usr/bin/env bash

# Get absolute path of the script.
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
ROOT_PATH=$( cd "$(dirname "${PARENT_PATH}")" ; pwd -P )   

YELLOW='\033[0;33m'
NC='\033[0m'

BUCKET="s3://sandeep.sh"
BUILD_DIR="$PARENT_PATH/build"

CLEAR_CMD="aws s3 rm $BUCKET --recursive"
UPLOAD_CMD="aws s3 sync $BUILD_DIR $BUCKET"

# -------------------------------------------------------------------
# -------------------------------------------------------------------

echo -e "\n-------$YELLOW Building for Production $NC-------"
rm -rf build && \
mkdir -p build && \
cp index.html build/ && \
cp sandeepfavicon.ico build/ && \
cp Sandeep-Jadoonanan-Resume.pdf build/ && \
cp -R css build/ && \
cp -R img build/

echo -e "\n-------$YELLOW Clearing S3 Bucket $NC-------"
echo -e $CLEAR_CMD
$CLEAR_CMD

echo -e "\n-------$YELLOW Uploading to S3 Bucket $NC-------"
echo -e $UPLOAD_CMD
$UPLOAD_CMD
