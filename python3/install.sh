#!/bin/bash

echo -e "› Upgading pip"
pip3 install --upgrade --user pip setuptools wheel # upgrade pip
echo -e "› Installing/Upgrading packages"
pip3 install --upgrade --user -r "${DOTDIR}/python3/requirements3.txt"

# speedtest installs 2 executable scripts
# speedtest and speedtest-cli, which both have the same
# functionatly. This removes speedtest-cli to make
# tab completion nicer
[[ ! $(command -v speedtest-cli | wc -c | xargs echo) == "0" ]] && rm `which speedtest-cli`
# xargs echo removes the extra spaces wc prepends to ouput
