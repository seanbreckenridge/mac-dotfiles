#!/bin/bash

printf "› Open chrome extension pages on the web store in default browser? (y/n) "
read -r -t 10 resp # 10 second time out
case "$resp" in
  y|Y )
    echo "› "
    cat "${DOTDIR}/chrome_extensions/links.txt" | "${DOTDIR}/bin/openlinks"
    ;;
  n|N ) ;;
  * ) ;;
esac
