#!/bin/bash

user="email"
pw="pwpwpwpwpwpw"
device="wlan1"

daten=$(curl -s --insecure --location --interface $device --cookie-jar cookie12354 http://8.8.8.8)
loginURL=$(echo "$daten" | grep -oP '(?<=<LoginURL>).*(?=</LoginURL>)' | sed -r 's/\&amp;/\&/g') #im letzten Schritt &amp; durch & ersetzen

# echo 2
echo "$loginURL"

antwort=$(curl -s --insecure --location --interface $device --location-trusted --cookie-jar cookie12354 --header 'cache-control: no-cache' --header 'content-type: application/x-www-form-urlencoded' --data "UserName=${user}&FNAME=0&button=Login&OriginatingServer=http%3A%2F%2Fgoogle.de&Password=${pw}" "$loginURL")

echo "$antwort"

rm cookie12354