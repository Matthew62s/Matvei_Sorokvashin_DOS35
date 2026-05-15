#!/bin/bash
file_name=$1
dir=$2
format=$3

if [ $# -ne 3 ]

then

	echo "Вы не указали все аргументы"
	echo "Укажите имя файла, папки и поиск формата файла"
else
	if [ -d $dir ]

	then
 		echo "Папка уже существуют, запишу в нее"
	else
		echo "Папки нет, создаю новую"
		mkdir "$dir"
	fi

	touch "$dir/$file_name"
	ls | grep $format > $dir/$file_name
fi
