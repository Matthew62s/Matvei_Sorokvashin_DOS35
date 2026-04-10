#Отчет по 2 уроку - GIT

1. Создадим 7 коммитов.

<img width="1919" height="833" alt="step1_make_7_commits" src="https://github.com/user-attachments/assets/00986d66-f75f-4e9b-8e6f-dd2c844ab305" />

2. Посмотрим git reflog и перейдем через git checkout HEAD~2 версии коммита.

<img width="1918" height="567" alt="step2_git_reflog" src="https://github.com/user-attachments/assets/ee7b346a-3fd9-43ac-a231-2c61b2b1fb9c" />

3. Создадим и перейдем в ветку git checkout -b develop.

<img width="913" height="164" alt="step3_branch_develop" src="https://github.com/user-attachments/assets/0c9ad4ed-0217-477d-b5e6-c76695b9fdfe" />

4. С помощью git commit --amend изменим уже существующий коммит.

<img width="1915" height="800" alt="step4_amend1" src="https://github.com/user-attachments/assets/e202aaf2-74a3-4e51-8f8b-3e096a689574" />
<img width="696" height="305" alt="step4_amend2" src="https://github.com/user-attachments/assets/50e8ad37-5e0d-49b8-8a03-0eb90706685a" />

5. Сделаем коммит в main.

<img width="1919" height="563" alt="step5_local_main" src="https://github.com/user-attachments/assets/2d1b9c8a-41a1-4b9f-a393-0520893e75f2" />

6. Создаем новую ветку release, из main через git reset --hard HEAD~1 удаляем последний коммит переключаемся на новую ветку.

<img width="700" height="166" alt="step6_main" src="https://github.com/user-attachments/assets/d959b375-511a-482e-b623-64ac3530497f" />
<img width="1917" height="345" alt="step6_release" src="https://github.com/user-attachments/assets/07530bcf-04af-4977-8507-f87cd17973f4" />

7. Сделаем изменения в файле локально.

<img width="1919" height="457" alt="step7_update_and_add_to_commit" src="https://github.com/user-attachments/assets/1c855097-3186-40f7-a693-a3b50d3c3b42" />

8. Отменим изменения в файле через git checkout HEAD~1 -- app8_local.py

<img width="742" height="203" alt="step8_git_checkout" src="https://github.com/user-attachments/assets/c4c7445b-bc6f-4f72-85b7-aaf472c49836" />

9. Вернемся к началу через git reset --hard HEAD~6 либо через удаление директории с локальным репозиторием и последующим созданием нового.

<img width="493" height="139" alt="step9_back_to_begin" src="https://github.com/user-attachments/assets/19010996-672f-404f-8827-c22a1514e204" />
