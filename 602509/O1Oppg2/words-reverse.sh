#!/bin/bash

mappe=$(echo $RANDOM | md5sum | sed -E 's/[^[:alnum:]]+//g')

./depunctuate.sh $mappe

if [[ -f task2.txt ]]; then
    exit 0

else


    #TODO word-reverse-11

    /repunctuate.sh $mappe

fi
