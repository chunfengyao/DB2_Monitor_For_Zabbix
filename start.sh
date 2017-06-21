#!/bin/bash

case $1 in
        ststus)
	cd script/ && ./JDBC_Connect.sh>log/JDBC_Connect.log && cd ..
                if [ $? == 1 ]
                then
                        #connect sucessful.
                        exit 1
                else
                        #connect failed,you can see log/JDBC_Connect.log for details.
                        exit 0
                fi
        ;;
        *)
	cd script/ && ./tablespace_check.sh $1 $2
        ;;
esac

