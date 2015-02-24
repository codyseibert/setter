SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
BASE_DIR="$SCRIPT_DIR"

BUILD_NUMBER="$1"
BUILD_NAME="setter_$BUILD_NUMBER"

UPLOADS_DIR="$BASE_DIR/build/app/public/images/uploads"
rm -rf $UPLOADS_DIR
mkdir $UPLOADS_DIR

APP_DIR="$BASE_DIR/build/app"
TAR_NAME="$BUILD_NAME.tar"

ARTIFACTS_DIR="$BASE_DIR/artifacts"
ARTIFACT_PATH="$ARTIFACTS_DIR/$TAR_NAME"

rm -rf $ARTIFACTS_DIR
mkdir $ARTIFACTS_DIR

cd "$APP_DIR"
tar -czf "$ARTIFACT_PATH" "."
