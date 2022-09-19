#!/bin/bash

task2=../task2.txt
task3=../task3.txt

dep=../task2.txt
cd $1
rm -f ../task3.txt
touch ../task3.txt
cat $dep > ../task3.txt
# leser linje for linje og hasjer linjer uten bokstaver || tall

    


while IFS="" read -r p || [ -n "$p" ]; do
    for f in ./*
    do
        str=${f:2}
        hs=${str::-4}

        if [ "$p" == "$hs" ]; then
            sed -i "s/$p/$(cat $f)/" ../task3.txt
        fi

        
    done
done < ../task3.txt