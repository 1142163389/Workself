read -p "您需要部署社区版/单机版呢？请输入[1/2]:"  version

data="/data/install/"

one_install () {
  sed -i "s/bk.com/cloud.bk.com/"  $dataglobals.env
  sed -ri "s/[a-z]{6}.[A-Z]{4}.[A-Z]{5}.[A-Z]{4}..[a-z]{1,}[0-9]{1,}+[A-Z]{1,}.*/export PAAS_ADMIN_PASS='123456'/"   $dataglobals.env
  cp install.config.new.sample  install.config
  
    while true:   
    do
      read -p "请输入您部署到哪台ip地址："  ip1
      ping  -c 2  -w 2 $ip1
        if [ $? ! -eq 0 ];then
         echo  "您的ip输入错误，请重新输入" 
         break
        fi
    done
               }  


more_install () {
  sed -i "s/bk.com/cloud.bk.com/"  $dataglobals.env 
       while true:
    do
      read -p "请输入中控机ip"      ip2
      read -p "请输入第一个节点ip"  ip3
      read -p "请输入第二个节点ip"  ip4
      ping  -c 2  -w 2 $ip2
    done 
                 }






ping () {
 a=`ping  -c 2  -w 2 $ip2  && ping  -c 2  -w 2 $ip3`
 b=`ping  -c 2  -w 2 $ip2  && ping  -c 2  -w 2 $ip4`
 c=`ping  -c 2  -w 2 $ip3  && ping  -c 2  -w 2 $ip4`
        }

case version in 
 1) 
  one_install ;;
 
 2)  
  more_install ;;
esac    
  
