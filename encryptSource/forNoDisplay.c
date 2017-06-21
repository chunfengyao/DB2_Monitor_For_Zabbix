#include <stdio.h>
#include <string.h>

main(){
char password[256];
char encryptpass[257];
printf("\t\t由于采用的为非文件加密而是输入流加密。所以，建议您先使用附带的测试程序测试您的加密过程\n");
printf("\t\t防止由于用户口令或者加密密文中存在特殊字符而导致密文加密失败\n");
printf("\t\t测试时请注意测试环境的安全\n");
printf("\t\t请输入DB2数据库监控用户用户口令（最高支持256位口令）\n\t\t（密文输入过程中无回显）\n");
system("stty -echo");
scanf("%s",password);
system("stty echo");
printf("\n\t\t请输入加密密文（最高支持256位加密密文）\n");
scanf("%s",encryptpass);
char str1[262];
char a1[] = "echo "; 
strcpy(str1,strcat(a1, password));
char a2[] = "|openssl enc -aes-256-cbc -pass pass:\"";
char str2[301];
strcpy(str2,strcat(a2, encryptpass));

char str3[] = "\" -out ./config/encrypt.record";
char encrypt[645];
strcpy(encrypt,strcat(strcat(str1, str2),str3));
system(encrypt);
};

