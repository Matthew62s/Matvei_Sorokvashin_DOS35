# Lesson03_Introduction_to_DevOps2.Operatin_systems.Part1
1. Скачаем образ ubuntu desktop c https://ubuntu.com/download/desktop
2. Установим на vmware workstation наш образ
3. Разметим диск через manual partition. Зададим папке /home/ размер 3G.
<img width="969" height="697" alt="step1_summary_for_disk" src="https://github.com/user-attachments/assets/719f05d2-ef9e-4758-86d2-38049359cba2" />
<img width="971" height="705" alt="step1_uselvm" src="https://github.com/user-attachments/assets/c2bdee1d-f2cb-4303-91e8-2797d21ba81b" />
<img width="976" height="699" alt="step2_manual_partition" src="https://github.com/user-attachments/assets/85130808-7eb0-49e6-9828-813d2e7316cf" />
<img width="998" height="702" alt="step2_summary" src="https://github.com/user-attachments/assets/51ffbe76-346d-41df-b38a-26589a36137e" />

4. Скачаем образ ubuntu server без GUI c https://ubuntu.com/download/server/thank-you?version=24.04.4&architecture=amd64&lts=true
5. Создадим виртуальную машину и после добавим ей жесткий диск SCSI, после начнем установку и разметим диск. Будет 2 диска sda и sdb, каждый по 20G, выдадим под папку /home/ один из наших дисков, размер папки укажем 20G.

<img width="754" height="729" alt="step3_add_disk" src="https://github.com/user-attachments/assets/2dbeddda-7f1f-48fb-9c6d-bfb5f9b3b6fb" />
<img width="1194" height="809" alt="step3_add_hard" src="https://github.com/user-attachments/assets/aebf2c60-991a-4aea-8251-55ed75748ae0" />
<img width="1302" height="819" alt="step3_install1" src="https://github.com/user-attachments/assets/67f9585a-1d05-4fc6-8368-4ead2169076d" />
<img width="1295" height="802" alt="step3_install2" src="https://github.com/user-attachments/assets/30383346-aa8f-4a6c-bbf5-105ee6ec806a" />
<img width="1293" height="810" alt="step3_install3" src="https://github.com/user-attachments/assets/1ce5c337-6658-4b2c-8995-8ec38adce62e" />
<img width="1293" height="802" alt="step4_install4" src="https://github.com/user-attachments/assets/1d8e7a7d-63fb-44b1-97b0-903f02bffda3" />
<img width="1294" height="808" alt="step4_install5" src="https://github.com/user-attachments/assets/db889edd-5f99-4a2a-b5fd-18e55d92e5cb" />
<img width="1297" height="805" alt="step4_install6" src="https://github.com/user-attachments/assets/33a7a45d-b254-4af0-8d17-2a51cd5c0b33" />
<img width="1305" height="812" alt="step4_install7" src="https://github.com/user-attachments/assets/5c4fb123-a260-487c-8aad-2d39855ffa0e" />
<img width="1181" height="791" alt="step4_install8" src="https://github.com/user-attachments/assets/7a64751a-c11d-4a70-b689-2b22782c84d1" />
<img width="688" height="258" alt="step4_install10" src="https://github.com/user-attachments/assets/7a198d05-9633-48dc-a9a5-28d21808f5fa" />

6. Настроим GUI для ubuntu server.
7. Обновим список пакетов и репозиториев: sudo apt-get update && sudo apt-get upgrade
8. Установим утилиту tasksel позволяющая установить нам нескольких пакетов в одном скоорденированном процессе: sudo apt-get install tasksel
9. Запустим командой tasksel менеджер установки и выберем gnome
<img width="1055" height="514" alt="step4_install89" src="https://github.com/user-attachments/assets/ee7c93dd-2fc3-4421-828c-c5115209ffd4" />
<img width="1286" height="811" alt="step4_install9" src="https://github.com/user-attachments/assets/d0d7ea1b-ef75-47a7-80c3-92779ec9f4a4" />

10. Установим диспетчер отображения GUI lightdm: sudo apt install lightdm
11. Запустим его и включим в автозагрузку: systemctl enable lightgm, systemctl start lightdm → запустится GUI
<img width="1716" height="954" alt="step4_install11" src="https://github.com/user-attachments/assets/7129c0f1-48b0-4466-805f-be14d685c26f" />
 
