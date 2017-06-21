#include <stdio.h>
#include <string.h>

int main()
{
	while(1)
	{
		printf("\t请输入您即将进行的操作：\n");
		printf("\t输入1并回车为创建测试的用户口令加密文件\n");
		printf("\t输入2并回车为输入解密密文并测试是否解密正确（会在本控制台窗口显示出您在选项1中所输入的用户口令！！！）\n");
		printf("\t输入3并回车即可清除所有测试中产生的文件并退出本测试程序\n");
		printf("请键入您的选择并回车确认：");
		int choice;
		scanf("%d",&choice);
		system("clear");
/*		switch (choice)
		{
		case :1 encrypt();
			break;
		case :2 decrypt();
			break;
		}*/
		if (choice == 1)
		{
			encrypt();
		}
		else if (choice == 2)
		{
			decrypt();
		}
		else
		{
			cleantestfiles();
			break;
		}
	}
	cleantestfiles();
	return 1;
}
int encrypt()
{
	char password[257];
	char encryptpass[257];
	printf("\t\t测试时请注意测试环境的安全\n");
	printf("\t\t请输入DB2数据库监控用户用户口令（最高支持256位口令）\n\t\t（密文输入过程中无回显！！！）\n");
	system("stty -echo");
	scanf("%s",password);
	system("stty echo");
	printf("\n\t\t请输入加密密文（最高支持256位加密密文）\n");
	scanf("%s",encryptpass);
	char str1[264];
	char a1[] = "echo "; 
	strcpy(str1,strcat(a1, password));
	char a2[] = "|openssl enc -aes-256-cbc -pass pass:\"";
	char str2[305];
	strcpy(str2,strcat(a2, encryptpass));
	char str3[] = "\" -out ../tmp/encrypt.record";
	char encrypt[650];
	strcpy(encrypt,strcat(strcat(str1, str2),str3));
	system(encrypt);
	return 1;
};

int decrypt()
{
	char decryptpass[257];
	printf("\n\t\t请输入解密密文（同加密密文）\n\n");
	scanf("%s",decryptpass);
	char b1[] = "openssl enc -d -aes-256-cbc -in ../tmp/encrypt.record -k \"";
	char destr1[312];
	strcpy(destr1,strcat(b1, decryptpass));
	char b2[] = "\"";
	char decrypt[315];
	strcpy(decrypt,strcat(destr1, b2));
	printf("\n以上是您在步骤1中输入的用户口令，请核实是否一致，如果一致则表示测试成功。\n\n",system(decrypt));
	return 1;
};

int cleantestfiles()
{
	char cleantestfiles[] = "rm -rf ../tmp/encrypt.record";
	system(cleantestfiles);
	return 1;
};
