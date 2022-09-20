in="/home/hans/OneDrive/Skole/HVL/Dat103/Oblig1/602509/O1Oppg1b/output.txt"

a=$(echo -n ',' | shasum)
b=$(echo -n 'r' | sha256sum)
c=$(echo -n ',' | sha256sum)

echo $a > t.temp
#cat t.temp

#echo $a
#echo $b

#echo -n ',' | shasum
#echo ',' | shasum

cat t.temp

sed -i -E 's/[^[:alnum:]]+//g' t.temp

cat t.temp

echo -n , > ./ut/$(cat t.temp).txt
