#!/bin/bash
##wget https://github.com/fermatliu/ubuntu_starter_script/pre-install_intl.sh
##scp osboxes@192.168.1.114:/home/osboxes/pre-install.sh .

##Check runner root or not
if (("$EUID" != 0)); then
  echo "pls run as root or sudo"
  exit
fi

##Remove default source 
rm -f /etc/apt/source.list

##Add archive.ubuntu source, you can change to local source
bash -c 'echo deb http://us.archive.ubuntu.com/ubuntu/ xenial main multiverse universe restricted > /etc/apt/sources.list.d/mirrorsarchiveubuntu.list'

apt-get autoclean

apt-get autoremove

apt-get update

apt-get install openssh-server vim tree dos2unix git -y

##apt-get install autoconf automake  binutils gettext  gettext-devel libtool

git config --global user.name "Your Name"
git config --global user.email "you@example.com"
