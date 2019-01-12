#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
#
# Source: https://github.com/holman/dotfiles/blob/master/homebrew/install.sh

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

echo "› tapping Homebrew/bundle"
brew tap Homebrew/bundle
echo "› brew update && brew upgrade"
brew update && brew upgrade
echo "› Brewfile"
brew bundle --file=$HOMEBREW_BREWFILE

exit 0
