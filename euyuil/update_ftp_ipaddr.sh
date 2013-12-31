#!/bin/bash

inet4_data=`/sbin/ifconfig eth0 | grep inet | head -1 --`
raw_ip_address=`echo $inet4_data | cut -dt -f 2 | cut -dn -f 1`
ip_address=`echo $raw_ip_address | sed 's/^[ ]//g'`

# echo $ip_address

cid='Your ID'
ckey='Your Key'
surl='API URI'

wget -q -O - \
   ${surl}?ip_address=$ip_address\&client_id=$cid\&client_key=$ckey

curtime=`/bin/date '+%Y-%m-%d %H:%M:%S'`
echo "[$curtime] FTP IP address is set to $ip_address."

