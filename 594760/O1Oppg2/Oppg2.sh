#!/bin/bash
#depunktuation script

#kopierer innholdet fra originalfil, denne blir ikke skrevet til i scriptet
cat org.txt > t1.temp

# lagrer pekere til filene til variabler
t1=t1.temp
t2=t2.temp
ut=ut.txt

# fjerner linjeshift og substituerer med "|"
tr '\n' '|' < $t1 | sed  -E 's/[^[:alnum:]]+/\n&\n/g' > $t2

# hasher alle linjenene som består av ikke (tall || nummer), den siste e-en gjorde susen:-)
# sed -r 's/[^[:alnum:]]+/echo -n "&" | sha256sum/ge' < $t2 > $t1

# en enklere måte å skrive linjen over
sed -r 's/[^[:alnum:]]+/sha256sum/ge' < $t2 > $t1

# fjerner alle ikke (tall || nummer) fra tekst, det vil si alle " " og "-" som kommer med hashingen
sed -r 's/[^[:alnum:]]+//g' < $t1 > $ut

#skriver ut ferdigbehandlet tekst fra ut.txt
cat $ut
