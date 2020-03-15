#!/bin/bash

source bashrc

set -e
docker-travis-build --no-cache
docker-travis sh -c "command -v travis"
docker tag \
  ckaserer/travis-cli:latest \
  ckaserer/travis-cli:$(\
    docker run --rm ckaserer/travis-cli travis version)
set +e