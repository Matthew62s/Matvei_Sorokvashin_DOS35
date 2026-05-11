## Lesson10
Task 1. 
pwd - /home/ubnt1/Matvei_Sorokvashin_DOS35/Lesson10_Essentials
root directory - "/" or "/root/"
Какое путевое имя получили? - relative - "~" absolute "/home/ubnt1/"

Task 2.
Создать в начальном каталоге два подкаталога. - mkdir -p ~/sub_dir1 ~/sub_dir2 
Просмотреть содержимое рабочего каталога ls or ls -la
Просмотреть содержимое родительского каталога не переходя в него ls ../
Вернутсья в начальный каталог - cd ~ (если начальным был home), cd..

Task 3.
Перейти в систменый каталог - cd /etc/
Просмотреть его содержимое - ls /etc/
Просмотреть содержимое начального каталога ls ~
Вернуться в начальный каталог - cd .. or cd ~

Task 4.
Удалить ранее созданные подкаталоги - rm -r ~/sub_dir1 ~/sub_dir2

Task 5.
Получить информацию по командам ls и cd с помощью утилиты man - man ls, man cd
 
Task 6.
Получить краткую информацию по командам ls и cd с помощью команды whatis и apropos - whatis ls , apropos ls
В чем различие - Основные различия между whatis и apropos заключаются в области поиска: whatis ищет только точное совпадение имени команды, а apropos ищет ключевое слово по всему описанию.

Task 7.
info ls, info cd

Task 8.
cd ~
mkdir -p Sorokvashin/-1/-2 Sorokvashin/-1/-3 Sorokvashin/-4

Task 9.
head -n 13 /etc/group
tail -n 13 /etc/group

Task 10.
Добавить 5G системе - /dev/sdb
<img width="465" height="158" alt="image" src="https://github.com/user-attachments/assets/bba86bf0-a067-476f-8f67-d007ab0c7e38" />
#fdisk /dev/sdb
#Command (m for help): n
#Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
#Select (default p): p

#Partition number (1-4, default 1): 
#First sector (2048-10485759, default 2048): 
#Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-10485759, default 10485759):
#Created a new partition 1 of type 'Linux' and of size 5 GiB.
#Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
#lsblk 
<img width="358" height="144" alt="image" src="https://github.com/user-attachments/assets/91461d35-64eb-4fd9-8cba-caa420b7f6db" />
mkfs.ext4 /dev/sdb1
mkdir -p /mnt/data
mount /dev/sdb1 /mnt/data
Добавим в автомонтирование
blkid /dev/sdb1
nano /etc/fstab
/dev/disk/by-uuid/8c37c469-33b2-4d9c-9333-35a27a45d6c8 /mnt/data ext4 defaults 0 2

