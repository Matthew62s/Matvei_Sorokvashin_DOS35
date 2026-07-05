## 1. Статичный сайт запущенный через docker, в нем разворачивается образ ubuntu, внутри ubuntu ставится nginx, curl, прокидывается конфиг nginx.conf и сам сайт index.html , в конце запускается nginx сервер. 
### Запуск: 
### docker build -t web00:1.0 .
### docker run -d -p 8080:8080 web00:1.0
<img width="1919" height="854" alt="Сайт" src="https://github.com/user-attachments/assets/751e895f-c0cd-4658-86e9-669de20e81d2" />

## 2. Сайт с динамичным контентом, создан docker-compose для управления образами, в нем запускается DB - postgres вместе с начальнеой съемой - init.sql, дальше билдится Dockerfile - php-fpm для работы с DB прокидывается бекенд файл сайта news.php, после запускается web-server nginx прокидывается конфиг и файлы сайта, index.html, app.js.
### Запуск:
### docker compose up --build -d
<img width="1917" height="762" alt="Сайт2" src="https://github.com/user-attachments/assets/7dd70ee5-c0ef-4742-a164-0396db3c26a5" />
