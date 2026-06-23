Установим docker:
1. curl -fsSL https://get.docker.com -o get-docker.sh
2. sudo sh get-docker.sh
3. проверим работоспособность docker - docker run hello-world

Установим nextcloud:
1. docker run -d -p 8080:80 --name nextcloud_cont nextcloud
2. остановим конетйнер nextcloud docker stop nextcloud_container
3. удалим этот конетйнер docker rm nextcloud_container
4. Узнаем информацию о конетйнере - docker inspect nextcloud_container
5. Удалим все образы контейнеры сети - docker system prune -a