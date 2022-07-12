#!/bin/bash
#
# Open multiple gnome tabs, connect to ssh and reconnect screen session
# @author webworker01
#

hosts=(
'hostname1'
'hostname2'
)

for host in "${hosts[@]}"; do
    gnome-terminal --tab --title="${host}" -- bash -ic "ssh -t ${host} 'screen -rd'"
done
