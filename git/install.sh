#!/bin/bash
#
# Sets global name and email config, default editor to atom, and checks
# if you have an ssh key set

echo "› Github configuration..."

# check for global name config
if [[ -z $(git config --global user.name) ]]; then
  printf "No global name set. Enter full name: "
  read -r githubusername
  git config --global user.name "$githubusername"
fi

# check for global email config
if [[ -z $(git config --global user.email) ]]; then
  printf "No global email set. Enter email connected to your GitHub account: "
  read -r githubemail
  git config --global user.email "$githubemail"
fi

git config --global core.editor nano

echo -e "› Finished GitHub configuration:"
# print configuration
git config --list | cat
