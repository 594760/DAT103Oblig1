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
echo "Read from following file:"
read input

if [[ -f "$input" ]]; then
    cat $input > $t1
else
   echo "repunctuate: filen finnes ikke, script avsluttes" 
   exit 1
fi



# fjerner linjeshift og substituerer med "|"
tr '\n' '|' <$t1 | sed -E 's/[^[:alnum:]]+/\n&\n/g' >$t2


# leser linje for linje og hasjer linjer uten bokstaver || tall
IFS=""
cat $t2 |
while read data; 
do
    
    if [[ $data =~ [^[:alpha:]] ]]; then
        echo -n $data >./$1/$(echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g').txt
        echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g' >>$ut

    else
        echo $data >>$ut
    fi

done

# sletter 
rm t1.temp
rm t2.temp
