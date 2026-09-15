Установим и настроим сервер zabbix

Установка

Install Zabbix repository
```
wget https://repo.zabbix.com/zabbix/7.4/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.4+debian13_all.deb
dpkg -i zabbix-release_latest_7.4+debian13_all.deb
apt update
```

Install Zabbix server, frontend, agent
```
apt install zabbix-server-pgsql zabbix-frontend-php php8.4-pgsql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent postgresql postgresql-contrib
```

Create initial database
```
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix
zcat /usr/share/zabbix/sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
```

Configure the database for Zabbix server
```
Edit file /etc/zabbix/zabbix_server.conf

DBPassword=password
```

Configure PHP for Zabbix frontend
```
Edit file /etc/zabbix/nginx.conf uncomment and set 'listen' and 'server_name' directives.
# listen 8080;
listen 8080;
server_name example.com;
```
Start Zabbix server and agent processes
```
systemctl restart zabbix-server zabbix-agent nginx php8.4-fpm
systemctl enable zabbix-server zabbix-agent nginx php8.4-fpm
```
