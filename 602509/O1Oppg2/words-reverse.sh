#!/bin/bash

# option --bypass
bpFlagg=False
while [ True ]; do
    if [ "$1" = "--bypass" ]; then
        bpFlagg=True
        shift 1
    else
        break
    fi
done

echo "Flagg = $bpFlagg"

mappe=$(echo $RANDOM | md5sum | sed -E 's/[^[:alnum:]]+//g')

./depunctuate.sh $mappe

if [[ -f task2.txt ]]; then

    if [[ "$bpFlagg" = False ]]; then
        
        #TODO word-reverse-11
        echo "./word-reverser.sh"
        
    fi

    ./repunctuate.sh $mappe

else
    echo "words-reverse: Tekstfil fra depunctuation.sh finnes ikke, script avsluttes"
    exit 0

fi

echo "words-reverse: done"