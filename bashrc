#!/bin/bash

readonly DOCKER_TRAVIS_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# docker-travis-build
function docker-travis-build () {
  local command="docker build -t ckaserer/travis-cli $@ ${DOCKER_TRAVIS_HOME}"
  echo "+ ${command}" && ${command}
}
readonly -f docker-travis-build
[ "$?" -eq "0" ] || return $?

# docker-travis-add-slack-token
function docker-travis-add-slack-token () {
  docker-travis "add-slack-token $@"
}
readonly -f docker-travis-add-slack-token
[ "$?" -eq "0" ] || return $?

# add-container-registry-credentials
function docker-travis-add-container-registry-credentials () {
  docker-travis "add-container-registry-credentials $@"
}
readonly -f docker-travis-add-container-registry-credentials
[ "$?" -eq "0" ] || return $?

# docker-travis-add-googlechat-webhook
function docker-travis-add-googlechat-webhook () {
  docker-travis "add-googlechat-webhook $@"
}
readonly -f docker-travis-add-googlechat-webhook
[ "$?" -eq "0" ] || return $?

# docker-travis-encrypt
function docker-travis-encrypt () {
  docker-travis "travis-encrypt $@"
}
readonly -f docker-travis-encrypt
[ "$?" -eq "0" ] || return $?

# docker-travis
function docker-travis () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v ${HOME}/.travis:/root/.travis -v $(pwd):/root ckaserer/travis-cli"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f docker-travis
[ "$?" -eq "0" ] || return $?
