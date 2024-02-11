#! /bin/bash

USR='devops'

for host in `cat remoteHost`           #remoteHost variable should be exported from the parent shell first
do
        echo "================================================================"
        echo "Connecting to $host"
        echo "Pushing script to $host"
        scp MultiOS_Web_Script.sh $USR@$host:/tmp/
        echo "Executing the script"
        ssh $USR@$host sudo /tmp/MultiOS_Web_Script.sh
        ssh $USR@$host sudo rm -rf /tmp/MultiOS_Web_Script.sh
        echo "================================================================"
        echo
done
