Установим docker:
1. curl -fsSL https://get.docker.com -o get-docker.sh
2. sudo sh get-docker.sh
<img width="1109" height="485" alt="Screenshot_1" src="https://github.com/user-attachments/assets/ad8d991d-46d7-4619-a741-421c0f97f56f" />
3. проверим работоспособность docker - docker run hello-world
<img width="1259" height="433" alt="hello world" src="https://github.com/user-attachments/assets/64265148-fc0f-4384-8b3f-3166f0e8e00f" />

docker images - <img width="1250" height="99" alt="docker images" src="https://github.com/user-attachments/assets/7c0f797b-d233-4c36-82dd-edb1f6ad6a69" />
В качестве примера установим nextcloud:
1. docker run -d -p 8080:80 --name nextcloud_cont nextcloud
<img width="1258" height="109" alt="docker ps" src="https://github.com/user-attachments/assets/87b7ceaa-99f5-413c-85f5-494b5fa806b0" />
<img width="1527" height="998" alt="nextcloud" src="https://github.com/user-attachments/assets/63f8ed06-0bf1-4b29-a8c1-c3639a417512" />
2. остановим конетйнер nextcloud docker stop nextcloud_container
3. удалим этот конетйнер docker rm nextcloud_container
<img width="616" height="43" alt="docker rm nextcloud" src="https://github.com/user-attachments/assets/db4f79ca-e320-4293-8343-05e6804dd286" />
4. Узнаем информацию о конетйнере - docker inspect nextcloud_container
5. Удалим все образы контейнеры сети - docker system prune -a
<img width="1261" height="273" alt="docker system prune" src="https://github.com/user-attachments/assets/f9ed8b4e-cd09-4510-bc4f-bc9325935577" />
Узнаем дисковое пространство до и после чистки.

До: <img width="596" height="178" alt="before prune" src="https://github.com/user-attachments/assets/a5d31a83-b40f-4404-9048-cf3d1eb887a0" />
После: <img width="772" height="464" alt="after prune" src="https://github.com/user-attachments/assets/b804ee77-2204-47da-b74a-0487b02c16f8" />
