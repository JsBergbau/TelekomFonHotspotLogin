# TelekomFonHotspotLogin
Dieses Skript vereinfacht das Login in einen Telekom-FON Hotspot. In diesem Fall gehen wir von einem 2. WLAN-Adapter aus und einer 2. Internetverbindung, über die man den PI Steuern kann. Das Skript kann aber genauso bei nur einer Internetverbindung verwendet werden.

Tipp: Die Telekom Hotspot-Flat kann man kostenlos zu einem DSL-Anschluss der deutschen Telekom dazubuchen, auch wenn man keinen Speedport-Router hat. 

Um das Problem mit dem Routing und mehreren Interfaces zu lösen, verwenden wir Policy-Routing. Hat man nur eine Internetverbindung, ist dieser Schritt nicht erforderlich
`sudo nano /etc/iproute2/rt_tables`
und am Ende 
`13 telekom`
anfügen


Die MAC-Adresse wird ebenfalls verschleiert, sicher ist sicher :)

Bitte in den einzelnen Skripten die Zeile `interface=` anpassen

Zu Beginn einfach 
`sudo ./setup` ausführen

Anschließend kann man minütlich via crontab `telekomLogin.sh` ausführen.
Da als URL Ziel http://8.8.8.8 verwendet wird, schlägt dies bei bestehender Verbindung fehl und es wird kein erneuter Loginversuch vorgenommen (auf 8.8.8.8 lauscht kein Webserver auf Port 80, Stand 23.03.2020). Ist man ausgeloggt, wird diese Anfrage abgefangen und man anschließend eingeloggt.

Manchmal kommt es vor, dass die Login-Seite nicht mehr kommt bzw. das Skript nicht funktioniert. Es lässt sich nicht einmal mehr der Login-Controller anpingen. Dieses Problem wurde auch bereits woanders beschrieben. Bei mir half es einfach eine andere MAC-Adresse zu verwenden und schon funktionierte alles wie es soll und ich war wieder online.

PS: Stand 23.03.2020 funktioniert DNS-Tunneling mit iodine https://github.com/yarrick/iodine
Damit ist es möglich auch ohne Backup-Internetverbindung auf den entfernten Raspberry-PI zuzugreifen, wenn sich das Login-Skript ändert. Leider erlauben nur wenige kostenlose DNS-Provider das setzen des hier benötigten NS-Eintrags. FreeDNS (https://freedns.afraid.org) ist eine positive Ausnahme. Wenn ihr mehr kennt, bitte einfach melden.

Der DNS-Tunnel ist allerdings extrem langsam. SSH lässt sich damit gerade so bedienen. Probiert es einfach aus. Für den Notfall kann es reichen.

# Nützliche Infos
Ausloggen geht (nur im Browser) via http://172.17.2.1:3990/logoff
https://telekom.portal.fon.com Der direkte Aufruf, selbst im Hotspot erzeugt immer einen 404 Fehler. Das ist ganz normal. 


