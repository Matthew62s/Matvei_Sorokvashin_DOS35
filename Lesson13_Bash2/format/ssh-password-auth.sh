#!/bin/bash

set -x
set -euo pipefail
path="/etc/ssh/"
config="*config"
options="$1"

if [ -z $options ]
then
    echo "Аргемент не передан"
    echo "Использование: yes or no"
    exit 1
fi

case "$options" in
    yes)
        find $path -name $config
	;;
    no)
        echo "gg"
	;;
    *)
        echo "Неверный аргумент $options , разрешено только yes or no"
        exit 1
        ;;
esac
set +x
