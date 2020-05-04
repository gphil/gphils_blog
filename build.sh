# build script for netlify builds
wget https://get.haskellstack.org/stable/linux-x86_64.tar.gz
tar -xvzf linux-x86_64.tar.gz
cp stack*/stack ./stack
./stack build --fast
./stack exec site build
