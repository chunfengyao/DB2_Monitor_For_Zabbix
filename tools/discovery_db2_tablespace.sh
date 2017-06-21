#!/bin/bash
table_spaces=(`cat ../log/TABLESPACES_SHOW_DETAIL.log |sed -e "1,3d" -e "s/[[:space:]]//g" -e "/^$/d" -e "/Tablespace/d" -e "/Type/d" -e "/Contents/d" -e "/State/d" -e "/Detailed/d" -e "/Normal/d" -e "/Total/d" -e "/Useable/d" -e "/Used/d" -e "/Free/d" -e "/High/d" -e "/Page/d" -e "/Extent/d" -e "/Prefetch/d" -e "/Number/d" | awk -F '=' '{print$2}'`)
length=(`grep -o 'Name' ../log/TABLESPACES_SHOW_DETAIL.log |wc -l`)

printf "{\n"
printf '\t'"\"data\":["
for ((i=0;i<$length;i++))
do
printf "\n\t\t{"
printf "\"{#TABLESPACE_NAME}\":\"${table_spaces[$i]}\"}"
if [ $i -lt $[$length-1] ]
then
printf ","
fi
done
printf "\n\t]\n"
printf "}\n"
