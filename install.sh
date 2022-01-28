#! /bin/bash
# By jcnf

check_root(){
	[[ "`id -u`" != "0" ]] && echo -e "${Error} must be root user !" && exit 1
}
directory(){
	[[ ! -d /opt/script/cron ]] && mkdir -p /opt/script/cron
	cd /opt/script/cron
}
install(){
	[[ ! -d /opt/script/cron ]] && wget -O cleanCache.sh https://raw.githubusercontent.com/Netflixxp/script/master/cleanCache.sh && wget -O cleanLog.sh https://raw.githubusercontent.com/Netflixxp/script/master/cleanLog.sh
	chmod -R +x /opt/script/cron/*
}
crontab -l | { cat; echo "*/2 * * * * /opt/script/cron/cleanCache.sh >/dev/null 2>&1"; } | crontab -
crontab -l | { cat; echo "*/2 * * * * /opt/script/cron/cleanLog.sh >/dev/null 2>&1"; } | crontab -
