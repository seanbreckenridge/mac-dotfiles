#!/bin/bash

set -e
echo "› Installing autoredshift..."
if [[ ! $(uname -s) == "Darwin" ]]; then
  echo -e "› Not on mac, exiting..."
  exit 1
fi

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# check if redshift is already in login items
if (( $(osascript -e 'tell application "System Events" to get the name of every login item' | grep autoredshift | wc -l) == 0)); then
  # add automator script to login items
  auto_redshift_app="${DOTDIR}/redshift/autoredshift.app"
  osascript -e "tell application \"System Events\" to make login item at end with properties {name:\"autoredshift\",path:\"${auto_redshift_app}\", hidden:false}"
  echo -e "› Installed autoredshift successfully."
else
  echo -e "› autoredshift is already a login item"
fi
