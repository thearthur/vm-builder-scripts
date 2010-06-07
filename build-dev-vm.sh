#!/bin/bash
set +x

NAME=aulfeldt
TASK=git
ME="Arthur Ulfeldt"

vmbuilder esxi ubuntu \
-v \
--name="$NAME-$TASK" \
--mem=1024 \
--cpus=2 \
--rootsize=20000 \
--user="$NAME" \
--name="$ME" \
--pass=changeme \
--hostname="$NAME-$TASK" \
--domain='build.hytrust.com' \
--ip=10.212.1.109 \
--mask=255.255.254.0 \
--gw=10.212.1.254 \
--dns=10.212.1.4 \
--addpkg=emacs \
--addpkg=openssh-server \
--addpkg=git-core \
--addpkg=subversion \
--addpkg=bash-completion \
--addpkg=wget \ 
--addpkg=openjdk-6-jdk
