#!/bin/bash

echo -e "› Upgading pip"
pip3 install --upgrade --user pip setuptools wheel # upgrade pip
echo -e "› Installing/Upgrading packages"
pip3 install --upgrade --user -r "${DOTDIR}/python3/requirements3.txt"
