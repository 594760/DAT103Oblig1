#!/bin/bash

#dep=/home/hans/OneDrive/Skole/HVL/DAT103/Oblig1/602509/O1Oppg2/task2.txt

rm -f task3.txt
touch task3.txt
cat task2.txt > task3.txt

cd $1
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
cd ..

#tr -s '\n' < task3.txt
cat task3.txt | tr -d '\n' > test.txt

echo "------------------- test.txt -------------------"
cat test.txt

#TODO her må vi få vekk mellomrommet etter alle ^alnum




cat test.txt | sed 's/|/\n/g' > task3.txt

echo $"\n\n"
echo "-------------------- task3.txt --------------------"

cat task3.txt