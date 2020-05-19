# build script for netlify builds

if [ ! -f $NETLIFY_CACHE_DIR/stack ]; then
    wget https://get.haskellstack.org/stable/linux-x86_64.tar.gz
    tar -xvzf linux-x86_64.tar.gz
    cp stack*/stack $NETLIFY_CACHE_DIR/stack
fi

$NETLIFY_CACHE_DIR/stack build --fast
$NETLIFY_CACHE_DIR/stack exec site build
