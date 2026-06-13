Lesson16
Установим certbot - apt install certbot
Выпустим сертификат для сайта из прошлого урока.
Запустим certbot командой - certbot
<img width="756" height="187" alt="Screenshot_2" src="https://github.com/user-attachments/assets/15a17bd6-1169-46f4-bce3-cea7dc3bdd84" />
Выберем интересующий нас web server, так как nginx у нас является reverse proxy будем ставить сертификат на него.
<img width="851" height="156" alt="Screenshot_1" src="https://github.com/user-attachments/assets/9f3cdaa9-afae-48af-b383-f7777806343f" />
Из конфигурации нашего веб сервера certbot сам нам предлагает домены для выбора, выберем домен
<img width="1151" height="188" alt="Screenshot_3" src="https://github.com/user-attachments/assets/0bebdaeb-fb21-4471-8f62-bf39e8fa998a" />
В моем случае сертификат уже выпущен, так что нажмем renew
<img width="982" height="508" alt="Screenshot_4" src="https://github.com/user-attachments/assets/2c8c6e1d-8c9e-4062-935b-7b66957e5464" />
Успешный выпуск сертификата
<img width="1144" height="706" alt="Screenshot_5" src="https://github.com/user-attachments/assets/a3ed288e-8b5c-4cbf-a1aa-e7c593ba2b4b" />
Параметры которые certbot добавил в файл конфигурации nginx
<img width="1914" height="919" alt="Screenshot_6" src="https://github.com/user-attachments/assets/e06014d4-090a-43d4-994a-fd3862a7fcb3" />
Валидный сертификат
