# Отчет по Lesson05_Introduction_to_DevOps2.Operaitn_systems.Part3

1. Установим MongoDB из внешнего репозитория с помощью скрипта mongo_inst.sh.

```bash
chmod +x mongo_inst.sh
./mongo_inst.sh
```

После запуска MongoDB устанавливается, сервис mongod запускается, создается база data и пользователь manager с правами только на чтение.

2. При запуске была обнаружена ошибка подключения MongoNetworkError: connect ECONNREFUSED 127.0.0.1:27017.

Причина оказалась в файле /tmp/mongodb-27017.sock, который остался от root, из-за чего mongod не мог удалить сокет и завершался с ошибкой.

Исправление:

```bash
sudo rm -f /tmp/mongodb-27017.sock
sudo systemctl restart mongod
```

3. Ознакомился со статьей по Bash: https://habr.com/ru/post/52871/

4. Скрипт change_extension.sh меняет расширение файла на заданное.

Пример запуска:

```bash
./change_extension.sh testfile.txt md
```

Результат:

```bash
testfile.md
```

Если у файла нет расширения, скрипт выводит сообщение У файла нет расширения.

5. Скрипт substring.sh выделяет подстроку по указанным позициям или удаляет ее.

Пример выделения:

```bash
./substring.sh abcdefgh 2 5
```

Результат:

```bash
bcde
```

Пример удаления:

```bash
./substring.sh abcdefgh 2 5 delete
```

Результат:

```bash
afgh
```
