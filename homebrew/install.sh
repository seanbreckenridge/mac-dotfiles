#!/bin/bash
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

echo "› tapping..."
brew tap 'homebrew/bundle'
brew tap 'caskroom/cask'
echo "› brew update && brew upgrade"
brew update && brew upgrade
echo "› upgrading casks"
brew cask upgrade
echo "› Brewfile"
brew bundle --file="$HOMEBREW_BREWFILE"
echo "› configuring shells"
if [[ $(which zsh) == "/bin/zsh" ]]; then
  # /usr/local/bin is first on the path in .zshenv
  # /usr/bin/env should now use brew installed versions
  hash -r
fi
# add brew installed zsh version to shells, use it by default
if (( $(grep -c "/usr/local/bin/zsh" /etc/shells) == 0 )); then
  sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
  chsh -s $(which zsh)
else
  echo "› shells have already been configured properly"
fi
