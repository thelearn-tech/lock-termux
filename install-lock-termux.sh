#!/bin/bash
# by thelearn-tech
# https://github.com/thelearn-tech
# https://github.com/thelearn-tech/lock-termux

install_script() {

cd /data/data/com.termux/files/home/lock-termux
chmod +x lock-termux
mv lock-termux /data/data/com.termux/files/usr/bin
}

install_pass() {

  cd /data/data/com.termux/files/usr/share
  touch lock_termux
  echo "$conpass" >> lock_termux
  echo "password saved in /data/data/com.termux/files/usr/share/lock_termux
  sleep 1 
  install_script
}

get_pass() {

 echo -e "\e[1;32m"
 read -p "enter password:- " userpass
 sleep 0.6
 read -p "comfirm password:- " conpass

 if [[ $userpass == $conpass ]]
   then
   install_pass
 else
  echo ""
  echo -e "\e[1;31m Password don't match"
  echo "" 
 fi

}

check_option() {
echo ""
read -p " y/n: " option

 if [[ $option == "y" ]]
   then
     get_pass
 elif [[ $option == "n" ]]
   then
   echo ""
   echo -e "\e[1;31muser interrupt\e[0m"
   echo ''
   sleep 0.7
   exit 1
 else
   echo -e "\e[1;31m Wrong input "
   sleep 0.88
   echo -e "\e[1;32monly 'y' or 'n' is allowed\e[0m"
   exit 1
 fi

}

clear
echo -e "\e[1;32m Wellcome Lock Termux Installation"
echo -e "\e[1;36m                  by thelearn-tech"
check_option
clear
echo -e "\e[1;32m Installation succesful\e[0m"
exit 1

