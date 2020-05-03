# build script for netlify builds
wget https://get.haskellstack.org/stable/linux-x86_64.tar.gz
tar -xvzf linux-x86_64.tar.gz
cp linux-x86_64/stack ./stack
./stack build
./stack exec site build
