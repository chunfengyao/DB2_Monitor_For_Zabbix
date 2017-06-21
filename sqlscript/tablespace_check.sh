#!/bin/bash

CEHCK_TYPE=$1
TABLESPACE_NAME=$2

#db2 tablespace check
#: UNIT
#usagepre: %            {（Total pages - Useable pages） / Total pages * 100}
#useablepre: %          {Useable pages / Total pages * 100}
#available: Byte                {Useable pages * Page size (bytes)}
###check: check for extend

case $CEHCK_TYPE in
usagepre)
sed -e "s/.*$TABLESPACE_NAME/$TABLESPACE_NAME/" ../tmp/TABLESPACES_SHOW_DETAIL.log |awk -F '=' '{printf "%.f\n",($11-$13)/$11*100}'
;;
usablepre)
sed -e "s/.*$TABLESPACE_NAME/$TABLESPACE_NAME/" ../tmp/TABLESPACES_SHOW_DETAIL.log |awk -F '=' '{printf "%.f\n",$13/$11*100}'
;;
available)
sed -e "s/.*$TABLESPACE_NAME/$TABLESPACE_NAME/" ../tmp/TABLESPACES_SHOW_DETAIL.log |awk -F '=' '{printf $13*$21}' && printf "\n"
;;
#check)
#if cat ../tmp/TABLESPACES_SHOW_DETAIL.log |sed -e "s/.*$TABLESPACE_NAME/$TABLESPACE_NAME/" |awk '{print $2}' |uniq |grep "YES" & >/dev/null
#then
#echo 1
#else
#echo 0
#fi
#;;
*)
echo -e "Usage:$0[ usagepre | usablepre | available ] [ TABLESPACE_NAME ]"
esac

