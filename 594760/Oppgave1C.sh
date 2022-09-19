echo "\n--------------------Making files--------------------\n"

a=$(echo -n ',' | sha256sum)
b=$(echo -n '.' | sha256sum)

echo $a

echo $a >t.temp

sed -i -E 's/[^[:alnum:]]+//g' t.temp

echo -n , >./Oppgave1C/$(cat t.temp).txt

echo "File $(cat t.temp).txt maked"

echo $b >t.temp

sed -i -E 's/[^[:alnum:]]+//g' t.temp

echo -n . >./Oppgave1C/$(cat t.temp).txt

echo "File $(cat t.temp).txt maked"
