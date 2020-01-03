#!/bin/bash

script_repo=bash-script-collection

set -ex
curl -fsSL https://github.com/ckaserer/${script_repo}/archive/master.zip > ${script_repo}.zip
unzip ${script_repo}.zip -d ${script_repo}
f=("${script_repo}"/*)
mv "${script_repo}"/*/* "${script_repo}"
rmdir "${f[@]}"
rm ${script_repo}.zip
ls -alh ${script_repo}/*
set +ex