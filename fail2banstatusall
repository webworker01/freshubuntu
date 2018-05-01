#!/bin/bash

JAILS=`sudo fail2ban-client status | grep "Jail list" | sed -E 's/^[^:]+:[ \t]+//' | sed 's/,//g'`
for JAIL in $JAILS
do
  sudo fail2ban-client status $JAIL
done
