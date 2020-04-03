systemctl stop NetworkManager
systemctl disable NetworkManager

echo "root soft nofile 102400
      root hard nofile 102400"  >>  /etc/security/limits.conf

ulimit -Hn 102400
ulimit -Sn 102400

mkdir /data
tar xf /root/bkce_src-5.1.26.tar.gz  -C /data
tar xf /root/ssl_certificates.tar.gz  -C /data/src/cert 
echo "nameserver  127.0.0.1"   >> /etc/resolv.conf 

mv /etc/yum.repos.d/CentOS-* /etc/yum.repos.d/all/
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo
yum clean all
yum repolist 




