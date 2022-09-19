echo -n ',' >./Oppgave1C/$(echo -n ',' | sha256sum | sed -E 's/[^[:alnum:]]+//g').txt

#echo -n ',' | sha256sum | sed -E 's/[^[:alnum:]]+//g'

#echo "Hei"
#echo $input