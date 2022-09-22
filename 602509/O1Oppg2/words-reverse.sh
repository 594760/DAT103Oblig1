#!/bin/bash

mappe=$(echo $RANDOM | md5sum | sed -E 's/[^[:alnum:]]+//g')

./depunctuate.sh $mappe

if [[ -f task2.txt ]]; then
 
    echo "repunct"
    #TODO word-reverse-11

    ./repunctuate.sh $mappe
else
   echo "exit"
    exit 0

fi


