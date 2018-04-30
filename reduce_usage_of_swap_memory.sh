#!/usr/bin/env bash

read -sp 'Enter Password for sudo: ' sudoPW

# To check the swappiness value
# cat /proc/sys/vm/swappiness

# To change the swappiness value A temporary change (lost on reboot) with a swappiness value of 10 can be made with

echo $sudoPW |sudo -S sysctl vm.swappiness=10

# To make a change permanent, edit the configuration file with your favorite editor:
# Search for vm.swappiness and change its value as desired.
# If vm.swappiness does not exist, add it to the end of the file like so:
# vm.swappiness=10
# Save the file and reboot.
