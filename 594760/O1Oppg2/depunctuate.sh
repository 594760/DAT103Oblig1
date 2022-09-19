#!/bin/bash

# lager filer
rm -f  task2.txt
touch t1.temp
touch t2.temp
touch task2.txt

# setter variabler som peker til filene
t1="t1.temp"
t2="t2.temp"
ut=task2.txt

# lage hash-mappe
mkdir -p $1

# kopierer inn standard input
cat org.txt >t1.temp

# fjerner linjeshift og substituerer med "|"
tr '\n' '|' <$t1 | sed -E 's/[^[:alnum:]]+/\n&\n/g' >$t2


# leser linje for linje og hasjer linjer uten bokstaver || tall
while IFS="" read -r p || [ -n "$p" ]; do

    if [[ $p =~ [^[:alpha:]] ]]; then
        echo -n $p >./$1/$(echo -n $p | sha256sum | sed -E 's/[^[:alnum:]]+//g').txt
        echo -n $p | sha256sum | sed -E 's/[^[:alnum:]]+//g' >>$ut

    else
        echo $p >>$ut
    fi

done <$t2

# sletter 
rm t1.temp
rm t2.temp
