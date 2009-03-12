#!/bin/bash

WORK=/home/udienz/antivirus
BASE=$WORK/avira/
PROSES=$BASE/inprogress/
SIMPAN=$WORK/update/avira
LOCK=$SIMPAN/Archive-In-Progress-`hostname -f`
TRACE=$SIMPAN/TIME.txt
touch $LOCK

LOGDIR=$WORK/log/
LOGFILE=$LOGDIR/log-`date +%F`-avira.log

cd $SIMPAN
mv ivdf_fusebundle_nt_en.zip ivdf_fusebundle_nt_en-lama.zip
wget http://dl.antivir.de/down/vdf/ivdf_fusebundle_nt_en.zip #> $LOGFILE

rm $LOCK

touch $TRACE
echo `date -u` > $TRACE
