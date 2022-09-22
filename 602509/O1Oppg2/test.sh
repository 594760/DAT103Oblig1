#!/bin/bash

#./depunctuate.sh test

#while getopts ':b' OPTION; do
#  case "$OPTION" in
#    b)
#      echo "--bypass"
#      ;;
#    ?)
#      echo "ingen option"
#      ;;
#    \?) # Invalid option
#    echo "Error: Invalid option"
#    exit;;
#  esac
#done
#shift "$(($OPTIND -1))"
#echo "done"
#./repunctuate test

while [ True ]; do
  if [ "$1" = "--alpha" -o "$1" = "-a" ]; then
    bpFlagg=1
    shift 1
  else
    break
  fi
done

echo $bpFlagg
