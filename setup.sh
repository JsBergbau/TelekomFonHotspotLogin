#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
interface="wlan1"

$DIR/fakeMAC.sh
systemctl stop wpa_supplicant.service
rm /var/run/wpa_supplicant/$interface
wpa_supplicant -c $DIR/wpa_supplicant.conf -i $interface -B
systemctl start wpa_supplicant.service
echo "Warten ein bisschen"
sleep 10s #Zeitgeben damit IP ermittelt wird
$DIR/telekomRoute.sh
