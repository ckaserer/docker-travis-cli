#!/bin/bash

# travis_encrypt_key_value "env.global" "mykey" "myvalue"
travis_encrypt_key_value () {
    local target=${1}
    local key=${2}
    local value=${3}

    travis_encrypt "${target}" ${key}="'"${value}"'"
}
readonly -f travis_encrypt_key_value
[ "$?" -eq "0" ] || return $?

# travis_encrypt "env.global" "mykey=myvalue"
travis_encrypt () {
    local target=${1}
    local value=${2}

    travis endpoint --set-default --pro > /dev/null

    if ! travis whoami --pro 2>&1 > /dev/null; then
        travis login --pro
    fi

    travis encrypt "${value}"  --pro --add ${target}
}
readonly -f travis_encrypt
[ "$?" -eq "0" ] || return $?