input=./CleanText/textClean.txt
temp=t.temp

tr '\n' '|' <$input | sed -E 's/[^[:alnum:]]+/\n&\n/g' >$temp

#cat $temp

sed -E 's/[^[:alnum:]]+/echo `echo -n & | sha256sum`/g;' $temp

#cat $temp
