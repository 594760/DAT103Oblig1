#!/bin/sh

# tar inn input fra bruker og lager mappen
echo "Enter folder name"
read mnavn
mkdir -p $mnavn

# lager tempfiler og kopierer tekst til $t1
cat org.txt > $mnavn/t1.temp
touch $mnavn/t2.temp
touch $mnavn/ut.txt

# lager pekere til filene
t1=$mnavn/t1.temp
t2=$mnavn/t2.temp
ut=$mnavn/ut.txt

# fjerner linjeshift og substituerer med "|"
tr '\n' '|' < $t1 | sed  -E 's/[^[:alnum:]]+/\n&\n/g' > $t2

# en enklere måte å skrive linjen over
sed -r 's/[^[:alnum:]]+/sha256sum/ge' < $t2 > $t1

# fjerner alle ikke (tall || nummer) fra tekst, det vil si alle " " og "." som kommer med hashingen
sed -r 's/[^[:alnum:]]+//g' < $t1 > $ut

#skriver ut ferdigbehandlet tekst fra ut.txt
cat $ut

rm $t1
rm $t2
rm $ut
rmdir -p $mnavn