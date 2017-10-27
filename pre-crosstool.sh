#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
	echo "Sorry, you need to run this as root"
	exit 1
fi

# install some package for crosstool-ng
apt-get install -y autoconf gperf flex help2man gawk ncurses-dev bison  libncurses5-dev texinfo
