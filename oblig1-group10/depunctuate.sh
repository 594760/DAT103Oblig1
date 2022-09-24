#!/bin/bash

# fjerner gammel output fil
rm -f task2.txt

# lager nye filer
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
    cat $input >$t1
else
    # sletter
    rm t1.temp
    rm t2.temp
    rm $ut
    echo "depunctuate: File dose not exsist, exiting the script."
    exit 1
fi

# fjerner linjeshift og substituerer med "|"
tr '\n' '|' <$t1 | sed -E 's/[^[:alnum:]]+/\n&\n/g' >$t2

# leser linje for linje og hasjer linjer uten bokstaver || tall
IFS=""
cat $t2 |
    while read data; do

        if [[ $data =~ [^[:alpha:]] ]]; then

            if [[ -f "./$1/$(echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g').txt" ]]; then

                pathToFile="./$1/$(echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g').txt"

                if [[ $data != $(cat $pathToFile) ]]; then
                    echo "filname does not match hash of content. "
                    echo "Path to file: $pathToFile"
                    exit 1
                fi

            else

                echo -n $data >./$1/$(echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g').txt

            fi

            echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g' >>$ut

        else
            echo $data >>$ut
        fi

    done

# sletter
rm t1.temp
rm t2.temp
