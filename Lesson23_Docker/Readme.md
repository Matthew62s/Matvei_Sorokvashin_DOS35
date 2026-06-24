Скачаем и запустим с docker hub mysql образ
1. docker run --name cont-mysql -e MYSQL_ROOT_PASSWORD=good_password -d mysql:latest
-v /opt/Matvei_Sorokvashin_DOS35/Lesson23_Docker:/var/lib/mysql 
<img width="1269" height="428" alt="docker run mysql1" src="https://github.com/user-attachments/assets/c07f05e5-f09a-4930-b9f3-d84ef6782f15" />

Создадим volume - docker volume create mysql-data1
<img width="878" height="40" alt="volume create" src="https://github.com/user-attachments/assets/0d89cda6-4402-4054-8d03-4ec54f3e6486" />

Подключим volume к конетйнеру - docker run --name cont-mysql2 -v mysql-data1:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=good_password -d mysql:latest
Создадим новую bridge сеть для конетйнера - docker network create -d bridge rbm
Подключим контейнер к bridge rbm - docker network connect cont-mysql2 rbm
<img width="1074" height="589" alt="docker network connect rbm" src="https://github.com/user-attachments/assets/19594c02-6173-4eb5-a556-2da7b848c4b3" />


Optional

1. docker run --name cont-mysql4 -v mysql-data4:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=good_password -d mysql:latest
2. nano /var/lib/docker/volumes/mysql-data4/_data/sometext
<img width="1409" height="103" alt="sometext" src="https://github.com/user-attachments/assets/72bf2923-1b15-4a78-9417-2a6b9338fb0b" />

3. docker exec -it 465 sh -c "echo 'text is present' >> /var/lib/mysql/sometext && echo 'Файл успешно записан'"
<img width="1407" height="195" alt="echo sometext" src="https://github.com/user-attachments/assets/4cd2ff1e-62a6-496f-b227-26ea4aa27550" />

4. docker logs 465
5. запустим еще 1 контейнер с общим volume 
docker run --name my-nginx3 -d -v mysql-data4:/etc/test/ nginx:latest
<img width="1747" height="458" alt="nginx sometext" src="https://github.com/user-attachments/assets/ce49c030-225a-4407-bc1b-e02f434d7f6b" />

6. docker stop cont-mysql4 my-nginx3
7. docker rm cont-mysql4 my-nginx3
8. docker rmi mysql:latest nginx:latest
9. docker volume rm $(docker volume ls)
10. docker network rm rbm
