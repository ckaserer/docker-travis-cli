#!/bin/bash

# add-slack-token
function add-slack-token () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/travis-cli add-slack-token"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f add-slack-token
[ "$?" -eq "0" ] || return $?

# add-docker-credentials
function add-docker-credentials () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/travis-cli add-docker-credentials"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f add-docker-credentials
[ "$?" -eq "0" ] || return $?

# add-googlechat-webhook
function add-googlechat-webhook () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/travis-cli add-googlechat-webhook"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f add-googlechat-webhook
[ "$?" -eq "0" ] || return $?

# travis-encrypt
function travis-encrypt () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/travis-cli travis-encrypt"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f travis-encrypt
[ "$?" -eq "0" ] || return $?
