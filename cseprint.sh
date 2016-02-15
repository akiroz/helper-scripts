#!/bin/bash

tmp='/tmp/cseprint.ps'
rtmp='~/cseprint.ps'
user='foo'

if [ $# -eq 2 ]; then
    pdf2ps $1 $tmp
    scp -oHostKeyAlgorithms=+ssh-dss $tmp "$user@gw.cse.cuhk.edu.hk:$rtmp"
    ssh -oHostKeyAlgorithms=+ssh-dss "$user@gw.cse.cuhk.edu.hk" "ssh linux1 'lpr -P $2 $rtmp; rm -f $rtmp'"
    rm $tmp
else
    echo 'usage: cseprint.sh [file.pdf] [printer]'
fi
