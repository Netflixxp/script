#! /bin/bash
# By jcnf

check_system(){
	if   [[ ! -z "`cat /etc/issue | grep -iE "debian"`" ]]; then
		apt-get install traceroute mtr -y
	elif [[ ! -z "`cat /etc/issue | grep -iE "ubuntu"`" ]]; then
		apt-get install traceroute mtr -y
	elif [[ ! -z "`cat /etc/redhat-release | grep -iE "CentOS"`" ]]; then
		yum install traceroute mtr -y
	else
		echo -e "${Error} system not support!" && exit 1
	fi
}
check_root(){
	[[ "`id -u`" != "0" ]] && echo -e "${Error} must be root user !" && exit 1
}
directory(){
	[[ ! -d /opt/script/cron ]] && mkdir -p /opt/script/cron
	cd /opt/script/cron
}
install(){
	[[ ! -d /opt/script/cron ]] && wget -O cleanCache.sh https://raw.githubusercontent.com/Netflixxp/script/master/cleanCache.sh && wget -O cleanLog.sh https://raw.githubusercontent.com/Netflixxp/script/master/cleanLog.sh && wget -O tab.txt https://raw.githubusercontent.com/Netflixxp/script/master/tab.txt
	chmod -R +x /opt/script/cron/*
}
bash(){
	cd /opt/script/cron
	cat tab.txt | while read line
	do
		echo "${line}" >> /var/spool/cron/root
    done
}
