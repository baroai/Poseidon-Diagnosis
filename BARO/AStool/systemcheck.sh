#!/bin/sh

echo "\n 1. Date :"
date

echo "\n 2. Hostname & IP :"
hostname -A && hostname -I 

echo "\n 3. Internet Test:"
curl ifconfig.me 
echo " \n"

echo "\n 2. Disk size :"
df -h

echo "\n 3. Memory size :"
free

echo "\n 3-1. Memory status :"
vmstat 2 5

echo "\n 4. CPU and I/O status :"
iostat 2 5

echo "\n 5. Port scan :"
ss -at |grep -v CLOSE

echo "\n 6. Remote connection process list :"
ss -lnt

echo "\n 11. check last connection user :"
lastlog | grep -v "Once"


echo "\n 12. Uptime"
uptime

echo "\n 13. current log in user list :"
w

echo "\n 14. GPU status :"
nvidia-smi

echo "\n 15. History :"
cat /home/$(whoami)/.bash_history |nl

echo "\n 16. syslog :"
cat /var/log/syslog
