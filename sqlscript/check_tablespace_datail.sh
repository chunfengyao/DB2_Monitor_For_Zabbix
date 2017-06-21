#!/bin/bash
>../log/TABLESPACES_SHOW_DETAIL.log

db2 connect to SAMPLE user db2inst1 using db2inst1

db2 -svf ../sqlscript/LIST_TABLESPACES_SHOW_DETAIL.sql -z ../log/TABLESPACES_SHOW_DETAIL.log

db2 disconnect SAMPLE
