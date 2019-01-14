#!/bin/bash
#
# command line interface to install updates from the Mac App Store

set -e
echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a
