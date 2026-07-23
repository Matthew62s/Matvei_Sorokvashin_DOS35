## AWS
Создадим аккаунт AWS
<img width="1919" height="949" alt="AWS create" src="https://github.com/user-attachments/assets/cc3fef42-0b71-43ba-b466-c1bb3452e917" />\
Создадим Instance в ec2
образ возьмем Amazon Linux.
<img width="1919" height="954" alt="ec2_instance_create" src="https://github.com/user-attachments/assets/4605de74-4030-49f3-87c1-112b2229da8d" />
Подключимся к новому instance
<img width="1919" height="959" alt="connect to vm" src="https://github.com/user-attachments/assets/fdbb326f-8c88-4291-8e2d-573ebd733f3f" />
Создадим S3 bucket
<img width="1919" height="989" alt="s3bucket" src="https://github.com/user-attachments/assets/a3fbe068-18a9-4392-a1c3-07696f903612" />
Загрузим файл в него
<img width="1919" height="906" alt="files3" src="https://github.com/user-attachments/assets/2b37de75-2c75-4871-914e-1104bc56f56d" />
Создадим базу данных
<img width="1917" height="954" alt="db_create" src="https://github.com/user-attachments/assets/fcb62f7b-97a7-4ec9-bd9a-7728233d6456" />
Подключимся к базе через созданный ранее instance
```
aws configure
Остальные шаги авторизации...
export RDSHOST="database-1-instance-1.cx66gsu86w1z.eu-north-1.rds.amazonaws.com" 
psql "host=$RDSHOST port=5432 dbname=postgres user=postgres sslmode=require password=$(aws rds generate-db-auth-token --hostname $RDSHOST --port 5432 --username postgres --region eu-north-1)"
```
<img width="1918" height="967" alt="DB_connect" src="https://github.com/user-attachments/assets/576b9e9b-4c0d-4649-a0ce-2a00adc3363b" />
Создадим уведомление о тратах больше 10 долларов
<img width="1919" height="986" alt="notify10$" src="https://github.com/user-attachments/assets/0b96b422-3aca-473d-9091-72fdeaded5b4" />
