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
