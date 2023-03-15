#!/bin/bash
self_interface=$(iwgetid | cut -d ' ' -f1)
self_ip=$(ip addr show ${self_interface} | grep inet -m 1 | awk '{print $2}' | cut -d '/' -f1)
jackal_ip=$(ssh jackal "ip addr show wlp2s0;exit;" | grep inet -m 1 | awk '{print $2}' | cut -d '/' -f1)


export ROS_IP=${self_ip}
export ROS_MASTER_URI=http://${jackal_ip}:11311
#sed -i '/#robots/,/#---/d' /etc/hosts
#echo "#robots" > /etc/hosts
#echo "$jackal_ip	cpr-j100-0682" > /etc/hosts
#echo "#---" > /etc/hosts
