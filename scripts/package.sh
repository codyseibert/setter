BUILDER_NUMBER="$0"
SETTER_VERSION="0.1.7_$BUILD_NUMBER"
LOCAL_SETTER_DIR="/home/setter/workspace/setter"
LOCAL_SETTER_APP_DIR="$LOCAL_SETTER_DIR/build/app"
LOCAL_SETTER_BUILD_DIR="/home/setter/builds"

SETTER_TAR_NAME="setter_v$SETTER_VERSION.tar"
LOCAL_SETTER_TAR_PATH="$LOCAL_SETTER_BUILD_DIR/$SETTER_TAR_NAME"

DEPLOY_SCRIPT="$LOCAL_SETTER_DIR/scripts/deploy.sh"

SETTER_IMAGES="$LOCAL_SETTER_APP_DIR/public/images/uploads"
rm -rf $SETTER_IMAGES
mkdir $SETTER_IMAGES

echo "cd into $LOCAL_SETTER_APP_DIR"
cd "$LOCAL_SETTER_APP_DIR"

echo "taring the app folder contents"
tar -czvf "$SETTER_TAR_NAME" "."

echo "copying the tar to the build directory"
cp "$SETTER_TAR_NAME" "$LOCAL_SETTER_BUILD_DIR"

echo "removing build artifact"
rm "$SETTER_TAR_NAME"
