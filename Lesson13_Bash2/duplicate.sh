file="$1"
#awk '!seen[$0]++' $file
#uniq $file
#sort -u $file
sed -r ':a; s/\b([[:alnum:]]+)\b(.*)\b\1\b/\1\2/g; ta; s/(, )+/, /g; s/, *$//' $file
