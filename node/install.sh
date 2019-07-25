#!/usr/bin/env bash

if [ ! $(which npm) ];then
  echo "npm doesn't exist, can't install global node modules"
  exit 1
fi

# update npm version
npm install -g npm

npm install --global \
    moby

npm update -g
