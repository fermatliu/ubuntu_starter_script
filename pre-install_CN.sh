#!/bin/bash
##wget https://github.com/fermatliu/ubuntu_starter_script/pre-install_CN.sh
##scp osboxes@192.168.1.114:/home/osboxes/pre-install.sh .

##Check runner root or not
if (("$EUID" != 0)); then
  echo "pls run as root or sudo"
  exit
fi

##Remove default source 
rm -f /etc/apt/source.list
rm -f /etc/apt/sources.list

##Add aliyun source, you can change to local source
bash -c 'echo deb http://mirrors.aliyun.com/ubuntu/ $(lsb_release) main multiverse universe restricted > /etc/apt/sources.list.d/mirrorsaliyun.list'

bash -c 'echo deb http://mirrors.aliyun.com/ubuntu/ $(lsb_release)-backports main multiverse universe restricted >> /etc/apt/sources.list.d/mirrorsaliyun.list'

apt-get autoclean

apt-get autoremove

apt-get update

apt-get install openssh-server vim tree dos2unix git -y

##apt-get install autoconf automake  binutils gettext  gettext-devel libtool

git config --global user.name "Your Name"
git config --global user.email "you@example.com"

##Add user & change to sudo group
#adduser testone
#usermod -aG sudo testone
