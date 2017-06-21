#!/bin/bash
cat ../log/TABLESPACES_SHOW_DETAIL.log >../tmp/TABLESPACES_SHOW_DETAIL.log
#cp -p ../log/TABLESPACES_SHOW_DETAIL.log ../tmp/TABLESPACES_SHOW_DETAIL.log
sed -i -e "/^$/d" -e "s/[[:space:]]//g" ../tmp/TABLESPACES_SHOW_DETAIL.log
sed -i -e ":a;N;$ s/\n/=/g;ba" ../tmp/TABLESPACES_SHOW_DETAIL.log

