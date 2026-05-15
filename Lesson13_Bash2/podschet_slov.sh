file=$1
date=$(date "+%d_%m_%Y")
if [ -z $file ]
then
	echo "Укажите файл"
	exit 1
else
	wc -w $file
fi

for files in *.log

do

	cp $files $files'_'$date.log

done

SHORT_HASH=$(git rev-parse --short HEAD)

for files1 in *.py

do

	cp $files1 $files1'_'$SHORT_HASH
done
