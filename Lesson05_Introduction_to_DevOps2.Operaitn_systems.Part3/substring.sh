#!/bin/bash

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]
then
    echo "Использование: $0 <строка> <начало> <конец> [delete]"
    exit 1
fi

str=$1
start=$2
end=$3
mode=$4

if [ -z "$mode" ]
then
    mode="extract"
fi

if [ "$start" -le 0 ] || [ "$end" -lt "$start" ]
then
    echo "Некорректные границы"
    exit 1
fi

if [ "$mode" = "extract" ]
then
    echo "$str" | cut -c$start-$end
    exit 0
fi

if [ "$mode" = "delete" ]
then
    left=$(echo "$str" | cut -c1-$(($start - 1)))
    right=$(echo "$str" | cut -c$(($end + 1))-)
    echo "$left$right"
    exit 0
fi

echo "Неизвестный режим"