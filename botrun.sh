#!/bin/bash
/usr/sbin/sshd -D
python3 -m interactive-bot

#!/bin/bash

USERNAME="root"
SCNAME="autoRunBot"


ME=`whoami`

if [ $ME != $USERNAME ] ; then
   echo "Please run the $USERNAME user."
   exit
fi

startBot() {

    python3 -m interactive-bot

   exit
}
 
start_ssh() {

    /usr/sbin/sshd -D

   exit
}

end_ssh() {

    killall -SIGTERM sshd

   exit
}

kill_ssh() {

    killall -SIGKILL sshd

   exit
}

case "$1" in
   start)
       startBot
       ;;
   start_ssh)
       start_ssh
       ;;
   end_ssh)
       end_ssh
       ;;   
   kill_ssh)
       kill_ssh
       ;;          
   *)
       echo  $"Usage: $0 {start(启动机器人)|start_ssh(启动ssh服务默认端口622)|end_ssh(关闭所有的ssh服务)|kill_ssh(强制关闭所有的sshd)}"
     
esac
