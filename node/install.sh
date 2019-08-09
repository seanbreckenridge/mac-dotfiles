#!/usr/bin/env bash
#
# Passing "--verbose" as the first arg will pass it to npm

if [ ! $(which npm) ];then
  echo "npm doesn't exist, can't install global node modules"
  exit 1
fi

# update npm version
npm install -g $1 npm

npm install --global $1 \
    moby

npm update -g $1
