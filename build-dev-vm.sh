#!/bin/bash
set -x

if [ $# -ne 5 ]; then
    echo "$0: vm's-name username full-name password email"
    exit 1
fi

NAME="$2"
TASK="$1"
PASSWORD="$4"
ME="$3"
EMAIL="$5"

post_install=`tempfile`
sed -e "s/FULLNAME/\"$ME\"/" -e "s/EMAIL/\"$EMAIL\"/" /home/arthur/vm-scripts/firstboot.sh > $post_install

exit 0
time vmbuilder kvm ubuntu \
-v \
-d $TASK \
--suite=maverick \
--mem=1024 \
--cpus=2 \
--rootsize=15000 \
--user="$NAME" \
--name="$ME" \
--pass="$PASSWORD" \
--hostname="$TASK" \
--domain='dev.cryptovide.com' \
--ip=192.168.122.120 \
--mask=255.255.255.0 \
--gw=192.168.122.1 \
--dns=208.67.222.222 \
--addpkg=emacs \
--addpkg=openssh-server \
--addpkg=bash-completion \
--addpkg=wget \
--addpkg=openjdk-6-jdk \
--addpkg=screen \
--addpkg=wget \
--addpkg=git-core \
--addpkg=git-svn \
--addpkg=xpra \
--addpkg=ant \
--addpkg=maven2 \
--addpkg=emacs-snapshot \
--addpkg=gitk \
--addpkg=openssh-server \
--libvirt=qemu:///system \
--firstlogin $post_install
#--execscript setup-clojure

