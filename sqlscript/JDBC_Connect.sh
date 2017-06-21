#!/bin/sh
if [ ! -n "$5" ]
then 
   echo You Don\'t Give This Script Enough Args To Tell Me The Connection Information!!!
   exit 2
fi
cd ../tools/ && java -jar JDBC_Connection_Test_For_DB2.jar $1 $2 $3 $4 $5
#$1:IP(127.0.0.1 or the remote ip address)
#$2:Port(JDBC port,Ep:60000)
#$3:DataBaseName(Ep:SAMPLE)
#$4:UserName(who can access the database or the testuser)
#$5:UserPassword

if [ $? == 1 ]
then
   echo The JDBC Connect For DataBase $3 Has Sucess...
   exit 1
else
   echo We Can\'t Connect To DataBase $3 By JDBC!!!
   echo And This is The Error Code: \{$?\} \(You Can Check The Error By: cat ..\/tools\/ReadMe.md\)...
   exit $?
fi

