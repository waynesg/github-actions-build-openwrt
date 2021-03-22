#!/bin/bash
#
# DO NOT EDIT THIS FILE but add config options to /etc/default/motd
# any changes will be lost on board support package update
#
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

THIS_SCRIPT="header"
MOTD_DISABLE=""

[[ -f /etc/default/motd ]] && . /etc/default/motd
for f in $MOTD_DISABLE; do
	[[ $f == $THIS_SCRIPT ]] && exit 0
done

. /etc/os-release
. /etc/openwrt_release

KERNELID=$(uname -r)

# if [ $(echo $BOARD_NAME | wc -c) -ge 18 ]; then
	# TERM=linux toilet -f standard -F metal $(echo $BOARD_NAME | sed 's/Orange Pi/OPi/' | sed 's/Nanopi/NPi/')
# else
	# TERM=linux toilet -f standard -F metal S905
# fi

printf '\nWelcome to \e[0;91mOpenWrt\x1B[0m %s %s %s %s,ASCII By @waynesg\n' "$DISTRIB_RELEASE $DISTRIB_REVISION $KERNELID"
echo ""
