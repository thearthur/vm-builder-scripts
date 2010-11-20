#!/bin/bash
set +x

if [ $# -ne 4 ]; then
    echo "$0: vm's-name username full-name password"
    exit 1
fi

NAME="$2"
TASK="$1"
PASSWORD="$4"
ME="$3"

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
--firstlogin /home/arthur/vm-scripts/firstboot.sh \
#--execscript setup-clojure

