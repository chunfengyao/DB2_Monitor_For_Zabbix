mkdir -p config
mkdir -p script
mkdir -p sqlscript
mkdir -p test_tools
mkdir -p tmp
mkdir -p tools
chmod 760 config/db2user_zabbix.conf
echo 请输入Zabbix用户的用户名
read zabbix_user
echo 请输入Zabbix用户所在的用户组组名
read zabbix_group
echo 请输入DB2监控用户的用户名
read db2_monitor_user
echo 请输入DB2监控用户所在的用户组组名
read db2_monitor_group
>config/db2user_zabbix.conf echo $db2_monitor_user
>>config/db2user_zabbix.conf echo $zabbix_user
echo 即将开始密码配置部分
sleep 0.5s
echo 请确认您的输入环境的安全
sleep 0.5s
echo 希望您可以先使用附带的test_tools目录下的test_encrypt_password.sh测试一下密文加密功能在您当前平台上的可用性。
sleep 1s
echo 谢谢您的配合。
echo 正在进入密文加密部分
sleep 2s
sh tools/create_encrypt_password_script.sh
sleep 2s
echo 输入加密密文以完成sql查询脚本的用户登录配置
read encrypt_password


openssl enc -d -aes256 -in encrypt.record -out testpassword.record -k ""



echo 配置部分已完成，正在进行插件目录权限的设置。

chmod -R +rx *
chmod 660 config/db2user_zabbix.conf
chown -R $zabbix_user:$zabbix_group *
chown -R $db2_monitor_user:$db2_monitor_group sqlscript/

