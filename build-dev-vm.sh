#!/bin/bash
set +x

if [ $# -ne 3 ]; then
    echo "$0: name task password"
    exit 1
fi

NAME=$1
TASK=$2
PASSWORD=$3
ME="Arthur Ulfeldt"

time vmbuilder kvm ubuntu \
-v \
-d $TASK \
--suit=maverick \
--mem=1024 \
--cpus=2 \
--rootsize=15000 \
--user="$NAME" \
--name="$ME" \
--pass="$PASSWORD" \
--hostname="$TASK" \
--domain='dev.cryptovide.com' \
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
--firstlogin firstboot.sh \
#--execscript setup-clojure

