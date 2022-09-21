#!/bin/bash

./depunctuate.sh test

while getopts 'b:' OPTION; do
  case "$OPTION" in
    b)
      echo "--bypass"
      ;;
    ?)
      echo "uten option"
      ;;
  esac
done
shift "$(($OPTIND -1))"

./repunctuate test