#include <stdio.h>
#include <string.h>

main(){
char password[256];
char encryptpass[257];
printf("请输入数据库监控用户密码\n");
scanf("%s",password);
printf("请输入加密密文（最高支持256位加密密文）\n注：请记住加密密文，后期仍会使用到！！！请勿存放于文件中！！！\n");
scanf("%s",encryptpass);
printf("您所输入的加密密文如下：\n");
char str1[262];
char a1[] = "echo "; 
strcpy(str1,strcat(a1, password));
char a2[] = "|openssl enc -aes256 -pass pass:\"";
char str2[296];
strcpy(str2,strcat(a2, encryptpass));

char str3[] = "\" -in ./password.record -out ./encrypt.record";
char encrypt[640];
strcpy(encrypt,strcat(strcat(str1, str2),str3));


/*
char str1[] = "echo ";
char str2[] = "|openssl enc -aes256 -pass pass:\"";
char str3[] = "\" -in ./password.record -out ./encrypt.record";
char encrypt[612];
strcpy(encrypt,strcat(strcat(strcat(strcat(str1, password),str2),encryptpass),str3));
*/
//echo db2inst1|openssl enc -aes256 -pass pass:"enssl enc -aes256 -pass pass:"" -in password.record -out encrypt.record
system(encrypt);
printf(encrypt,"\n");
};

