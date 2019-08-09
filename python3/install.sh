#!/bin/bash
#
# Passing --verbose as the first arg will pass it to pip commands

pip3 install --upgrade --user $1 pip setuptools wheel # upgrade pip
pip3 install --upgrade --user $1 -r "${DOTDIR}/python3/requirements3.txt"
# upgrade other packages
python3 -m pip list --outdated --format=freeze | cut -d "=" -f 1 | xargs -n1 python3 -m pip install --user --upgrade $1

# speedtest installs 2 executable scripts
# speedtest and speedtest-cli, which both have the same
# functionatly. This removes speedtest-cli to make
# tab completion nicer
[[ $(command -v speedtest-cli) ]] && rm `which speedtest-cli`
