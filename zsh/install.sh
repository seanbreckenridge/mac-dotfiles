#!/bin/bash

# make sure original oh-my-zsh files are removed
original_files=("${HOME}/.zshenv" "${HOME}/.zshrc" "${HOME}/.zsh_history")

for file in "${original_files[@]}"; do
  if [ -f "$file" ]; then
    rm "$file"
  fi
done

DOTDIR="${HOME}/dotfiles"

if [ ! -f ~/.zshenv ]; then
  ln -s "${DOTDIR}/zsh/.zshenv" ~/.zshenv
fi

# hush login
if [ ! -f ~/.hushlogin ]; then
  echo -e "This stops the 'Last Login' message when you open a new terminal window." > ~/.hushlogin
fi

if [ ! -d ~/Dev ]; then
  mkdir ~/Dev
fi

# need to add ruby before system ruby, cant do this in .zshenv since
# mac will mess up the paths
# see here: https://github.com/clvv/oh-my-zsh/blob/master/README.md#mac-os-x
if [ -f /etc/paths ]; then
  sudo rm /etc/paths
  sudo ln "${DOTDIR}/zsh/.etcpaths" /etc/paths
fi
