#!/bin/bash
##wget https://github.com/fermatliu/ubuntu_starter_script/pre-install_local.sh
##scp osboxes@192.168.1.114:/home/osboxes/pre-install.sh .

#echo "This scripts checks the existence of the messages file."
if [ ! -f ubuntu-16.04.2-server-amd64.iso ]; then
    echo "File not found!"
else
    echo "ISO File exist!"
fi

# f529548fa7468f2d8413b8427d8e383b830df5f6
# sha1sum ubuntu-16.04.2-server-amd64.iso
if [ "$(sha1sum ubuntu-16.04.2-server-amd64.iso)" != "f529548fa7468f2d8413b8427d8e383b830df5f6  ubuntu-16.04.2-server-amd64.iso" ];then
   echo "File dirty!"
   echo "ReDownload"
   rm -f ubuntu-16.04.2-server-amd64.iso
   wget http://mirrors.aliyun.com/oldubuntu-releases/16.04.2/ubuntu-16.04.2-server-amd64.iso
else
   echo "File Significant!"
fi

##Check runner root or not
if (("$EUID" != 0)); then
  echo "pls run as root or sudo"
  exit
fi

## mount iso file
mount ubuntu-16.04.2-server-amd64.iso /cdrom/ -oloop

##Remove default source 
rm -f /etc/apt/source.list

## add cdrom
touch /etc/apt/source.list
apt-cdrom -d=/cdrom/ add

apt-get autoclean

apt-get autoremove

apt-get update

apt-get install openssh-server vim tree dos2unix git -y

##apt-get install autoconf automake  binutils gettext  gettext-devel libtool

git config --global user.name "Your Name"
git config --global user.email "you@example.com"
