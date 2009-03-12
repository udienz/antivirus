#!/bin/bash

WORK=/home/udienz/antivirus
BASE=/home/udienz/antivirus/symantec/
PROSES=$BASE/inprogress/
SIMPAN=$WORK/update/norton
mkdir -p $PROSES
#cd update/symantec/inprogress/
LOCK=$SIMPAN/Archive-In-Progress-`hostname -f`
TRACE=$SIMPAN/TIME.txt
touch $LOCK

LOGDIR=$WORK/log/
LOGFILE=$LOGDIR/log-`date +%F`-symantec.log
wget -c http://www.symantec.com/business/security_response/definitions/download/detail.jsp?gid=n95 -O $PROSES/US-N95.html
cat $PROSES/US-N95.html | grep "i32.exe" | awk 'BEGIN { FS = "\"" } { print $6 }' > $PROSES/address
cat $PROSES/US-N95.html | grep "x86.exe" | awk 'BEGIN { FS = "\"" } { print $6 }' >> $PROSES/address
cat $PROSES/US-N95.html | grep "i64.exe" | awk 'BEGIN { FS = "\"" } { print $6 }' >> $PROSES/address
cat $PROSES/address
mkdir -p $SIMPAN
cd $SIMPAN
wget -c -i $PROSES/address #> $LOGFILE
touch $TRACE
echo `date -u` > $TRACE
#mkdir norton/
#mv *.exe norton
rm -rf $PROSES
rm $LOCK
#touch /mnt/website/update/symantec/
