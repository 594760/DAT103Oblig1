#!/bin/bash

# option --bypass
bpFlagg=False
while [ True ]; do
    if [ "$1" = "--bypass" ]; then
        bpFlagg=True
        shift 1
    elif [ ! -z "$1" ]; then
        >&2 echo "$1 : Command not found"
        exit 1
    fi
done

# Lager en random mappe navn til hasene
mappe=$(echo $RANDOM | md5sum | sed -E 's/[^[:alnum:]]+//g')

# Kjører depunctuate og lagere det i en fil
./depunctuate.sh $mappe 1>task2.txt

# Skjekker om filen fra depuncuate finnes
if [[ -f task2.txt ]]; then

    # Vist baypass er false kjører dennne koden
    if [[ "$bpFlagg" = False ]]; then
        
        #TODO word-reverse-11
        echo "./word-reverser.sh"
        
    fi

    # Kjører repunctate
    ./repunctuate.sh $mappe

# Kjører vis filen fra depuncuate ikke finnes
else
    >&2 echo "words-reverse: Tekstfil fra depunctuation.sh finnes ikke, script avsluttes"
    exit 1

fi

# Fjerner midlertidig mappe
rm -r $mappe
echo "words-reverse: done"