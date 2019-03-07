#!/bin/bash
#
# command line interface to install updates from the Mac App Store

set -e

if [[ $(uname -s) == "Darwin" ]]; then
  echo -e "› macos/update.sh installs update from the Mac App Store."
  printf "› install updates? (y/n) "
  read -t 15 resp # timeout after 15 seconds
  case "$resp" in
    y|Y )
      echo "› sudo softwareupdate -i -a"
      sudo softwareupdate -i -a
      ;;
    n|N ) ;;
    * ) printf "Invalid response (%s). Use (y/n)" $resp
  esac
else
  echo -e "› Not on macOS, skipping macos"
fi


