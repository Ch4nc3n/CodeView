#!/bin/sh

if [[ $1 == "start" ]]; then
    
    pid=`ps |grep "dropbear"|grep -v grep | awk '{print $1}'`

    if [ -n "$pid" ]; then 
        kill -9 $pid
    fi
    
    /usr/sbin/dropbear
elif [[ $1 == "stop" ]]; then
    
    pid=`ps |grep "dropbear"|grep -v grep | awk '{print $1}'`

    if [ -n "$pid" ]; then 
        kill -9 $pid
    fi    
 
fi

exit 0
