#!/bin/bash
# Origin Script by http://lqman.wordpress.com

WORK=/home/udienz/antivirus
BASE=$WORK/avg7free/
PROSES=$BASE/inprogress/
SIMPAN=$WORK/update/avg
LOCK=$SIMPAN/Archive-In-Progress-`hostname -f`
TRACE=$SIMPAN/TIME.txt
touch $LOCK
LOGDIR=$WORK/log/
LOGFILE=$LOGDIR/log-`date +%F`-avg.log

mkdir -p $PROSES

cd $PROSES
wget -c http://www.grisoft.com/ww.download-update-7 -O $PROSES/donlod.html
cat donlod.html | grep .bin | cut -d'=' -f6 > donlod2.html
cat donlod.html | grep .bin | cut -d'=' -f8 >> donlod2.html
cat donlod.html | grep .bin | cut -d'=' -f9 >> donlod2.html
cat donlod2.html | grep "http:" | cut -d '"' -f2 > donlod3.html
cat $PROSES/donlod3.html
jmlbrs=`wc donlod3.html | awk '{print $1}'`
for i in `seq 1 $jmlbrs`; do basename `head -n $i donlod3.html | tail -n 1`; done > namafile
for i in `seq 1 $jmlbrs`
do
mkdir -p $SIMPAN
cd $SIMPAN
wget -c -i $PROSES/donlod3.html #> $LOGFILE
done

rm $LOCK

touch $TRACE
echo `date -u` > $TRACE