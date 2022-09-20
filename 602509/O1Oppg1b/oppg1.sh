input="input.txt"
output="output.txt"
echo "------------Original tekst------------\n"
cat $input
tr '\n' '|' < $input | sed  -E 's/[^[:alnum:]]+/\n&\n/g' > $output
echo "\n\n-------------Editert tekst-------------\n"
cat $output