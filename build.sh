# build script for netlify builds

BUILD_CACHE_DIR=/opt/build/cache

if [ ! -f $BUILD_CACHE_DIR/stack ]; then
    wget https://get.haskellstack.org/stable/linux-x86_64.tar.gz
    tar -xvzf linux-x86_64.tar.gz
    cp stack*/stack $BUILD_CACHE_DIR/stack
    echo "Current dir:\n"
    pwd
    echo "Build cache dir:\n"
    echo $BUILD_CACHE_DIR
    $BUILD_CACHE_DIR/stack build --fast
    cp .stack $BUILD_CACHE_DIR/.stack
fi

$BUILD_CACHE_DIR/stack exec site build

