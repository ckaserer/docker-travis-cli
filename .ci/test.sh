#!/bin/bash

source bashrc

set -e
docker-travis-build --no-cache
docker-travis sh -c "command -v travis"
set +e