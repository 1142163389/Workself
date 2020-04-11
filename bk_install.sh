read -p "您需要部署社区版/单机版呢？请输入[1/2]:"  version
case version in
 1)
  one_install ;;

 2)
  more_install ;;
esac



data="/data/install/"
num="10.0.0"

one_install () {
    while true:   
    do
      read -p "请输入您部署到哪台ip地址："  ip1
      ping  -c 2  -w 2 $ip1
        if [ $? ! -eq 0 ];then
         echo  "ip格式错误，无法通信此ip" 
         break
        fi
    done

cp $datainstall.config.new.sample  $datainstall.config
sed -i "8,15s/^/#/"  $datainstall.config
sed -ri "4,6s/[0-9]{2}.[0-9]{1}.{2}.[0-9]{1}/$ip1/1"  $datainstall.config
sed -i "s/bk.com/cloud.bk.com/"  $dataglobals.env
sed -ri "s/[a-z]{6}.[A-Z]{4}.[A-Z]{5}.[A-Z]{4}..[a-z]{1,}[0-9]{1,}+[A-Z]{1,}.*/export PAAS_ADMIN_PASS='123456'/"   $dataglobals.env 
               }  


ping2 () {
    while true:   
    do
      read -p "请输入中控机ip"      ip2
      ping  -c 2  -w 2 $ip1
        if [ $? ! -eq 0 ];then
         echo  "ip格式错误，无法通信此ip" 
         break
        fi
    done
        }

ping3 () {
    while true:   
    do
      read -p "请输入第一个节点ip"  ip3
      ping  -c 2  -w 2 $ip1
        if [ $? ! -eq 0 ];then
         echo  "ip格式错误，无法通信此ip" 
         break
        fi
    done
        }

ping4 () {
    while true:   
    do
      read -p "请输入第二个节点ip"  ip4
      ping  -c 2  -w 2 $ip1
        if [ $? ! -eq 0 ];then
         echo  "ip格式错误，无法通信此ip" 
         break
        fi
    done
        }


more_install () {
ping1
ping2
ping3
cp $datainstall.config.new.sample  $datainstall.config
sed -i "8,15s/^/#/"  $datainstall.config
sed -i "4s/$num.1/$ip2/1"  $datainstall.config
sed -i "5s/$num.2/$ip3/1"  $datainstall.config
sed -i "6s/$num.3/$ip4/1"  $datainstall.config
sed -i "s/bk.com/cloud.bk.com/"  $dataglobals.env 
sed -ri "s/[a-z]{6}.[A-Z]{4}.[A-Z]{5}.[A-Z]{4}..[a-z]{1,}[0-9]{1,}+[A-Z]{1,}.*/export PAAS_ADMIN_PASS='123456'/"   $dataglobals.env
                 }


