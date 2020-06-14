# 
# Required files
LAYER_CONFIG_FILE="layer_config.yaml"
REQUIREMENTS_FILE="requirements.txt"

LAYER_NAME=$(grep 'name:' $LAYER_CONFIG_FILE);
LAYER_NAME=${LAYER_NAME//*name: /};
LAYER_NAME=${LAYER_NAME%$'\r'}

PYTHON_VERSION=$(grep 'python:' $LAYER_CONFIG_FILE);
PYTHON_VERSION=${PYTHON_VERSION//*python: /};
PYTHON_VERSION=${PYTHON_VERSION%$'\r'}


BUILD_DIR="layer"
TARGET_DIR="$BUILD_DIR/python/lib/python$PYTHON_VERSION/site-packages"
mkdir -p $TARGET_DIR

pip install -r $REQUIREMENTS_FILE -t "./$TARGET_DIR"

#LAYER_NAME=$(grep -A3 'name:' $LAYER_CONFIG_FILE | tail -n1 | awk '{ print $2}')
#LAYER_NAME=${LAYER_NAME%$'\r'}

ZIP_LAYER_NAME="${LAYER_NAME}.zip"
cd $BUILD_DIR
zip -r "../$ZIP_LAYER_NAME" *
cd ..
rm -r $BUILD_DIR

echo "Created layer: $LAYER_NAME in $ZIP_LAYER_NAME"
