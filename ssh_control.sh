#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
	echo "Sorry, you need to run this as root"
	exit 1
fi

##start ssh on ubuntu
mv /etc/init/ssh.conf.back /etc/init/ssh.conf
start ssh

#stop ssh on ubuntu

##stop ssh
#mv /etc/init/ssh.conf /etc/init/ssh.conf.back

##start ssh on debian
#rm -f /etc/ssh/sshd_not_to_be_run
#systemctl enable ssh
#systemctl start ssh
#systemctl status ssh


##stop ssh on debian
#systemctl stop ssh
#systemctl disable ssh