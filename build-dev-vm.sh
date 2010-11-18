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

vmbuilder esxi ubuntu \
-v \
--mem=1024 \
--cpus=2 \
--rootsize=10000 \
--user="$NAME" \
--name="$ME" \
--pass="$PASSWORD" \
--hostname="$TASK" \
--domain='build.hytrust.com' \
--ip=10.212.1.118 \
--mask=255.255.254.0 \
--gw=10.212.1.254 \
--dns=10.212.1.4 \
--addpkg=emacs \
--addpkg=openssh-server \
--addpkg=subversion \
--addpkg=bash-completion \
--addpkg=wget \
--addpkg=openjdk-6-jdk \
--addpkg=screen \
--addpkg=wget \
--addpkg=git-core \
--addpkg=git-svn \
--addpkg=gitk 

