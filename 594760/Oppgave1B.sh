input="textClean.txt"
output="text1B.txt"

echo "\n--------------------Orginal tekst--------------------\n"

cat $input

tr '\n' '|' <$input | sed -E 's/[^[:alnum:]]+/\n&\n/g' >$output

echo "\n\n--------------------Editert tekst--------------------\n"

cat $output
