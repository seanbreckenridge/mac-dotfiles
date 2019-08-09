#!/bin/bash
#
# command line interface to install updates from the Mac App Store

set -e

if [[ $(uname -s) == "Darwin" ]]; then
  echo -e "› macos/update.sh installs update from the Mac App Store."
  echo "› sudo softwareupdate -i -a"
else
  echo -e "› Not on macOS, skipping macos"
fi
