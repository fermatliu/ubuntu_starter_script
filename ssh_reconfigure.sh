#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
	echo "Sorry, you need to run this as root"
	exit 1
fi

#Debian,Ubuntu  lost ssh key 
#Could not load host key: /etc/ssh/ssh_host_rsa_key

rm -r /etc/ssh/ssh*key
dpkg-reconfigure openssh-server