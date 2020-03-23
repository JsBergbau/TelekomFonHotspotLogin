#!/bin/bash

interface="wlan1"

sudo ifconfig $interface down
sudo ifconfig $interface hw ether ab:88:89:90:81:ff
sudo ifconfig $interface up

