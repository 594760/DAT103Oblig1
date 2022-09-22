#!/bin/bash

# fjerner gamle filer hvis de finnes
rm -f task3.txt
rm -f t3.temp

#lager nye filer
touch task3.txt
touch t3.temp

# setter t3 variabel
t3=t3.temp

# kopierer outut fra depunctuate til t3
cat task2.txt >$t3

# bytter arbeidskatalog
cd $1

# leser linje for linje og hasjer linjer uten bokstaver || tall
while IFS="" read -r p || [ -n "$p" ]; do
    for f in ./*; do
        str=${f:2}
        hs=${str::-4}

        if [ "$p" == "$hs" ]; then
            sed -i "s/$p/$(cat $f)/" ../$t3
        fi

    done

done <../$t3
cd ..

# fjerner linjeskift og bytter | med nye linjeskift
tr -d '\n' <$t3 | sed 's/|/\n/g' >task3.txt

# fjerner temp filer
rm -f $t3
