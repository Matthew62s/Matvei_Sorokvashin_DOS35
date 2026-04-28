#!/bin/bash

if [ "$#" -ne 2 ]
then
    echo "Использование: $0 <имя_файла> <новое_расширение>"
    exit 1
fi

old_name=$1
new_extension=${2#.}
new_name=${old_name%.*}.$new_extension

if [ ! -e "$old_name" ]
then
    echo "Файл не найден"
    exit 1
fi

if [ "$old_name" = "${old_name%.*}" ]
then
    echo "У файла нет расширения"
    exit 1
fi

mv "$old_name" "$new_name"
echo "$new_name"