#!/bin/sh
if [ -f /etc/debian_version ]; then
   echo "debian"
   apt install wget 
   wget https://github.com/Derrity/acme-new/releases/download/releases/debian.sh
   bash debian.sh
elif [ -f /etc/redhat-release ]; then
   echo "centos"
   yum install wget 
   wget https://github.com/Derrity/acme-new/releases/download/releases/centos.sh
   bash centos.sh
else
   echo "不支持的系统，滚～"
   exit;
fi
