#!/bin/bash

f_date() { timedatectl | sed 's/ /\n/';}
f_disk() { df -h;}
f_free_disk() { free -h;}

date_now="$(f_date)"
disk_now="$(f_disk)"
disk_free="$(f_free_disk)"

echo "Дата и время: $date_now"
echo "Использование диска: $disk_now"
echo "Свободная память: $disk_free"

echo -e "\033[0;34mУстановка htop!\033[0m"
#apt-get install htop -y   # Для тестирования закоментил
dpkg -s htop
if [ $? -ne 0 ];
then
	echo -e "\033[0;31mУстановка прошла неудачно\033[0m"
else
	echo -e "\033[0;32mУстановка прошла удачно\033[0m"
fi

echo -e "\033[0;34mУстановка mc!\033[0m"
apt-get install mc -y
dpkg -s mc
if [ $? -ne 0 ];
then
	echo -e "\033[0;31mУстановка прошла неудачно\033[0m"
else
	echo -e "\033[0;32mУстановка прошла удачно\033[0m"
fi


echo -e "\033[0;34mУстановка tree!\033[0m"
apt-get install tree -y
dpkg -s tree
if [ $? -ne 0 ];
then
	echo -e "\033[0;31mУстановка прошла неудачно\033[0m"
else
	echo -e "\033[0;32mУстановка прошла удачно\033[0m"
fi

echo -e "\033[0;34mЗапишем все установленные пакеты в файл installed_packages.txt\033[0m"

dpkg --get-selections > installed_packages.txt
if [ -s installed_packages.txt ];
then
	echo -e "\033[0;32mПакеты успешно записаны в $file\033[0m"
else
	echo -e "\033[0;31mЗапись пакетов прошла не удачно\033[0m"
fi
