#!/bin/bash

echo "Установка зависимостей для MongoDB"
sudo apt update
sudo apt install dirmngr gnupg apt-transport-https ca-certificates curl -y

curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg

echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/8.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

sudo apt update
sudo apt install mongodb-org -y

sudo systemctl start mongod
sudo systemctl enable mongod

if ! systemctl is-active --quiet mongod
then
	echo "MongoDB не запустилась"
	exit 1
fi

mongosh --quiet --eval '
use data
db.createCollection("data")
db.createRole({
	role: "managerRole",
	privileges: [
		{
			resource: { db: "data", collection: "data" },
			actions: [ "find" ]
		}
	],
	roles: []
})
db.createUser({
	user: "manager",
	pwd: "manager123",
	roles: [
		{ role: "managerRole", db: "data" }
	]
})
'

echo "MongoDB установлена"
echo "База data и пользователь manager созданы"

