# DB2_Monitor_For_Zabbix
DB2的Zabbix监控模块（基本功能都已完成），剩余部分比较简单了。有需要的话，后期会进行完善。加密部分使用的是AES-256-CBC的加密算法，没有进行编码处理。解密的部分如有需要后期会补上。该插件可以拷贝多份，以监控多个库。只要保证相对目录结构完整即可。里面的两个脚本start.sh是用来传参数获取数值的，regular.......的那个脚本是用来添加到crontab里面的（注意用户及环境变量！！！需要加到DB2用户组里！！！crontab执行时的环境变量，如果在修改后并未重启希望使用如下crontab内容）


*/10 * * * * source ~/.bash_profile && cd /app/zabbix/plugins/DB2_Monitor_For_Zabbix/ && ./regular_excute_plan.sh

重启后可修改如下

*/10 * * * * cd /app/zabbix/plugins/DB2_Monitor_For_Zabbix/ && ./regular_excute_plan.sh
