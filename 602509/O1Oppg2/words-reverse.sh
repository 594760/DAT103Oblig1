#!/bin/bash

mappe=$(echo $RANDOM | md5sum | sed -E 's/[^[:alnum:]]+//g')

./depunctuate.sh $mappe

if [[ -f task2.txt ]]; then

    #TODO word-reverse-11 med option logikk

    ./repunctuate.sh $mappe

else
    echo "words-reverse: Tekstfil fra depunctuation.sh finnes ikke, script avsluttes"
    exit 0

fi
