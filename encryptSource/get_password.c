#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int main()
{
    String n,p;
    char ch,acnt[256],pwd[256];  
    scanf("%d",&n);  
    while(n--)  
    {  
        system("cls");//清屏  
        p=0;
        puts("请输入账号：");
        scanf("%s%*c",acnt);  
        puts("请输入密码：");  
        system("stty -echo");
		c=getchar();
		system("stty echo"); 
        p=0;  
        system("pause");  
    }  
    return 0;  
}  