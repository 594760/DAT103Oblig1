#!/bin/bash
#setter fil variabelen
input="hello.txt"
orig="text.txt"
output="text1.txt"
tom="tom.txt"
#skriver inn tekst fra annen fil
cat $tom > $output
cat $output
cat $orig > $input

#utskrift og lage fil
#cat $fil

#finne tekst i fil og gi ut linjer med treff
#grep aa $fil

#finne tekst og telle antall linjer med treff
#grep -c $finn1 $fil

#sette inn tekst i fil
#echo "Jeg prover aa sette inn denne teksten" >> hello.txt

#utskrift
echo "original teskt: \n"
cat $input


#bytte ut en String med en annen tr '\n1' '|' < $fil og skriver inn dette i filen igjen
#tr '\n' '|' < $input > $output
#grep -Eo '\w+|[^\w]' $
#echo "\nByttet ut '\n' med '|'"
#cat $output

#sette inn linjeskift
#sed -i -r 's/[[:space:]]/ \n\n/g' $output
#echo "\nsetter inn linjeskift"
#cat $output

#sette inn linjeskift før komma
#sed -i -r 's/,/\n,/g' $output

# sette inn linjeskift før og etter |
#sed -i -r 's/|/\n|\n/g' $output

# ,\n| -> ,|
#sed 's/$/|/g' $input > $output

#sed -E 's/\>/\n/g' $input > $output
#sed   's/$/|/' $input | tr -d '\n' > $output
#sed -E 's/[ ^[:alnum:]+/\n&\n/g]'
#sed  's/$/|/g; s/[^a-zA-Z,.|]/7/g; s/7/\n/g' $input > $output
#tr  '\n' '|' < $input > $output
tr '\n' '|' < $input | sed  -E 's/[^[:alnum:]]+/\n&\n/g' > $output

#sed -i 's/,/7,/g' $output
#sed -r 's/[^ ]* */\n&\n/g' $output #$output # denne virker nesten!!!
#sed -r  's/[:alpha:]\s/\n&/g' $input > $output
#utskrift
echo "\n\n-------------- Editert fil: ---------------\n"
cat $output