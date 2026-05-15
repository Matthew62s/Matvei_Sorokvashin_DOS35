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
	name="${files%.*}"
        ext="${files##*.}"
        cp "$files" "${name}_${date}.${ext}"

done

SHORT_HASH=$(git rev-parse --short HEAD)

for files1 in *.py

do
	name="${files1%.*}"
        ext="${files1##*.}"
        cp "$files1" "${name}_${SHORT_HASH}.${ext}"
done
