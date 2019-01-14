#!/bin/bash

# .installed is an empty file to represent that atom
# has already been symlinked
if [ ! -f ${DOTDIR}/atom/.installed ]; then
  rm -rf ~/.atom
  ln -s ${DOTDIR}/atom/atom/ ~/.atom
  touch ${DOTDIR}/atom/.installed
  echo "› symlinked atom directory"
else
  echo "› atom has already been symlinked"
fi
