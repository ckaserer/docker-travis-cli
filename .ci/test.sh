#!/bin/bash

source bashrc
echo "password" | add-docker-credentials test
add-googlechat-webhook test
add-slack-token abc