#!/bin/bash
user=$(whoami)
echo -e  "Current user is - \e[3;36m${user}\e[0m"
	echo \n 
echo -e  "                         ***  \e[1;32mSystem info\e[0m  ***"
        echo
#OS

id; uname -a; lsb_release -a
        echo
echo -e "\e[35mUsers found:\e[0m "
cat /etc/passwd | grep "/home" |cut -d: -f1
        echo
#service

echo -e "\e[33mOpen ports:\e[0m "
lsof -i -P -n | grep LISTEN
echo
#SUID
echo -e "\e[31mSUID:\e[0m"
find / -perm /4000 -type f 2>/dev/null
	echo
echo -e "\e[35mProcess status:\e[0m "
ps
	echo
	echo
echo -e "                          ***  \e[1;32mnetwork info\e[0m  ***"
	echo
    echo -e "\e[40;1mIPv4\e[0m (\e[1;31minternal\e[0m): " 
      ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
	echo
    echo -e "\e[40;1mIPv4\e[0m  (\e[1;34mpublic\e[0m): "
echo $(curl -s https://api.ipify.org)
        echo
    echo -e "\e[32;1mDefault gateway\e[0m: "
netstat -nr | awk '$1 == "0.0.0.0"{print$2}'
