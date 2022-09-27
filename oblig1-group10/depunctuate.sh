#!/bin/bash

# Sjekker om comand line argumenten er med
if [ -z "$1" ]; then
    >&2 echo "Mising comand line argument"
    
    exit 1
fi

# lager nye filer
touch "t1.temp"
touch "t2.temp"

# setter variabler som peker til filene
t1="t1.temp"
t2="t2.temp"

# lage hash-mappe
mkdir -p "$1"

# kopierer inn standard input
cat > "$t1"

# fjerner linjeshift og substituerer med "|"

tr '\n' '|' <"$t1" | sed -E 's/[^[:alnum:]]+/\n&\n/g' >"$t2"

# leser linje for linje og hasjer linjer uten bokstaver || tall
IFS=""
cat "$t2" |
    while read "data"; do

        # sorterer ut linjer ute bokstaver og tall
        if [[ "$data" =~ [^[:alpha:]] ]]; then

            # finner ut om filen eksister fra før av
            if [[ -f "./$1/$(echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g')" ]]; then

                pathToFile="./$1/$(echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g')"

                # kjører vis det er feil med hash filen
                if [[ "$data" != $(cat $pathToFile) ]]; then
                    >&2 echo "filname does not match hash of content. Path to file: $pathToFile"
                    # Fjerner temp-filer
                    rm t1.temp
                    rm t2.temp
                    exit 1
                fi

            else
                # Lager hash filen som ikke finnes fra før av
                echo -n "$data" >"$1"/$(echo -n $data | sha256sum | sed -E 's/[^[:alnum:]]+//g')

            fi
            # Skriver ut hashen i output
            echo -n "$data" | sha256sum | sed -E 's/[^[:alnum:]]+//g'

        else
            # Skriver ut orden i output
            echo "$data"
        fi

    done

# sletter temp filer
rm t1.temp
rm t2.temp