#!/bin/bash

if [ ! -f ~/.zshenv ]; then
  ln -s ${DOTDIR}/zsh/.zshenv ~/.zshenv
else
  echo "› ~/.zshenv symlink already exists"
fi

# hush login
if [ ! -f ~/.hushlogin ]; then
  echo -e "This stops the 'Last Login' message when you open a new terminal window." > ~/.hushlogin
fi

echo -e "› Installing zsh theme prompt"
npm install --global pure-prompt
