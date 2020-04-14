#!/bin/bash
/usr/local/gse/agent/bin/gsectl stop
cd /usr/local/gse/plugins/bin/ && ./stop.sh basereport 
rm -rf /usr/local/gse /var/log/gse /var/run/gse /var/lib/gse 
cd /data/install/ && cp uninstall/uninstall.sh .
bash uninstall.sh
cd /data/  &&  ./bkcec clean cron  &&   ./bkcec stop all   &&   ./bkcec status all 
chattr -i /data/install/.migrate/*
rm -rf /data/install /data/bkce /data/src
rpm -ev python27-2.7.9 python27-devel
yum remove nginx rabbitmq-server beanstalkd
mkdir /root/bk
mv /usr/local/bin/*  /root/bk
rm -f /root/.bkrc
rm -rf /etc/rc.d/bkrc.local
sed -ri "s/.*cloud.[a-z]{2}.[a-z]{3}//"  /etc/hosts
sed -ri  "/^nameserver 127.0.0.1$/d"  /etc/resolv.conf    

