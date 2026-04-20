#!/bin/bash


echo -e "\033[34mУстановка зависимостей для mongodb \033[0m"

sudo apt-get install dirmngr gnupg apt-transport-https ca-certificates curl -y

dpkg -s dirmngr gnupg apt-transport-https ca-certificates curl

if [ $? -ne 0 ];

then
        echo "Установка прошла неудачно"
	exit 1
else
        echo "Установка завершилась"
fi

curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor

if [ -s "/usr/share/keyrings/mongodb-server-8.0.gpg" ];
then
	echo "GPG ключ добавлен"
else
	exit 1
fi

echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/8.0 main" | \
   sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

if [ -s "/etc/apt/sources.list.d/mongodb-org-8.0.list" ];
then
	echo "Репозиторий установлен"
else
	exit 1
fi

sudo apt update -y

sudo apt install mongodb-org -y

dpkg -s mongodb-org

if [ $? -ne 0 ];

then
	echo "Установка прошла неудачно"
else
	echo "Установка завершилась"
fi

echo "Установим mongodb compass"

wget https://downloads.mongodb.com/compass/mongodb-compass_1.32.3_amd64.deb
sudo apt install ./mongodb-compass_1.32.3_amd64.deb -y

