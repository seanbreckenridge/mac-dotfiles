#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
#
# Passing --verbose as the first arg will pass it on to relevant brew functions
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

brew tap 'homebrew/bundle'
brew tap 'caskroom/cask'
brew update $1 && brew upgrade $1
brew cask upgrade
brew bundle --file="$HOMEBREW_BREWFILE" $1
# run greedy upgrade
python3 "${DOTDIR}/homebrew/greedy_upgrade.py" && brew cask upgrade --greedy $1

if [[ $(which zsh) == "/bin/zsh" ]]; then
  # /usr/local/bin is first on the path in .zshenv
  # /usr/bin/env should now use brew installed versions
  hash -r
fi
# add brew installed zsh version to shells, use it by default
if (( $(grep -c "/usr/local/bin/zsh" /etc/shells) == 0 )); then
  sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
  chsh -s $(which zsh)
fi
