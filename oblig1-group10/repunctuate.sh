#!/bin/bash

#dep=/home/hans/OneDrive/Skole/HVL/DAT103/Oblig1/602509/O1Oppg2/task2.txt

rm -f task3.txt
rm -f t3.temp
touch task3.txt
touch t3.temp
t3=t3.temp
cat task2.txt > $t3


cd $1
# leser linje for linje og hasjer linjer uten bokstaver || tall
while IFS="" read -r p || [ -n "$p" ]; do
    for f in ./*
    do
        str=${f:2}
        hs=${str::-4}

        if [ "$p" == "$hs" ]; then
            sed -i "s/$p/$(cat $f)/" ../$t3
        fi

        
    done
done < ../$t3
cd ..

tr -d '\n' <$t3 | sed 's/|/\n/g' > task3.txt

rm -f $t3