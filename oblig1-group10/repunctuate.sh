#!/bin/bash

#dep=/home/hans/OneDrive/Skole/HVL/DAT103/Oblig1/602509/O1Oppg2/task2.txt

rm -f task3.txt
rm -f test.txt
touch task3.txt
touch test.txt
cat task2.txt > test.txt

cd $1
# leser linje for linje og hasjer linjer uten bokstaver || tall
while IFS="" read -r p || [ -n "$p" ]; do
    for f in ./*
    do
        str=${f:2}
        hs=${str::-4}

        if [ "$p" == "$hs" ]; then
            sed -i "s/$p/$(cat $f)/" ../test.txt
        fi

        
    done
done < ../test.txt
cd ..

tr -d '\n' <test.txt | sed 's/|/\n/g' > task3.txt

rm -f test.txt