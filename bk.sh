if [  ! -z $http_proxy  ];then
 echo  '$http_proxy'为非空，值为"$http_proxy"
 exit
fi

if [ ! -z $https_proxy ];then 
 echo '$https_proxy'为非空，值为"$https_proxy"
 exit
fi

systemctl stop NetworkManager
systemctl disable NetworkManager


systemctl stop firewalld
systemctl disable firewalld

setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

which rsync 
if [ $? -ne 0 ];then 
 yum -y install rsync 
fi 
 

echo "root soft nofile 102400
root hard nofile 102400"  >>  /etc/security/limits.conf

ulimit -Hn 102400
ulimit -Sn 102400

mkdir /data
tar xf /root/bkce_src-5.1.26.tar.gz  -C /data
tar xf /root/install_ce-1.6.24.168.tgz  -C /data
tar xf /root/ssl_certificates.tar.gz  -C /data/src/cert 

mkdir /etc/yum.repos.d/all
mv /etc/yum.repos.d/* /etc/yum.repos.d/all/
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo
yum clean all
yum repolist 




