#!/bin/bash

printf "› Open firefox addon pages on the web store in default browser? (y/n) "
read -r -t 10 resp # 10 second time out
case "$resp" in
  y|Y )
    echo "› "
    cat "${DOTDIR}/firefox_addons/links.txt" | "${DOTDIR}/bin/openlinks"
    ;;
  n|N ) ;;
  * ) ;;
esac
