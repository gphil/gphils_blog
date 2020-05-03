# build script for netlify builds
curl -sSL https://get.haskellstack.org/ | sh
stack build
stack exec site build
