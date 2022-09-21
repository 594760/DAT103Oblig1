#!/bin/bash

#./depunctuate.sh test

while getopts ':b' OPTION; do
  case "$OPTION" in
    b)
      echo "--bypass"
      ;;
    \?) # Invalid option
    echo "Error: Invalid option"
    exit;;
  esac
done
shift "$(($OPTIND -1))"
echo "done"
#./repunctuate test