# build script for netlify builds

BUILD_CACHE_DIR=/opt/buildhome/cache

if [ ! -f $BUILD_CACHE_DIR/stack ]; then
    wget https://get.haskellstack.org/stable/linux-x86_64.tar.gz
    tar -xvzf linux-x86_64.tar.gz
    echo $NETLIFY_CACHE_DIR
    pwd
    ls
    cp stack*/stack $BUILD_CACHE_DIR/stack
    cp .stack $BUILD_CACHE_DIR/.stack
fi

$BUILD_CACHE_DIR/stack build --fast
$BUILD_CACHE_DIR/stack exec site build
