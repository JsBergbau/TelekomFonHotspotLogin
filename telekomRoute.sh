#!/bin/bash

interface="wlan1" #Achtung unbedingt auch bei neueROute=manuell ändern 

IP=$(ip addr show $interface | grep -Po 'inet \K[\d.]+')
echo ip rule add from $IP table telekom
ip rule | grep telekom
erg=$?
if [ ! $erg -eq 0 ]  #nur wenn die Regel noch nicht existiert hinzufügen
then
	ip rule add from $IP table telekom
fi
neueRoute=$(ip route | grep -oP 'default.*wlan1')
echo ip route add $neueRoute table telekom
ip route add $neueRoute table telekom

