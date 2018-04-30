#!/usr/bin/env bash
#read -sp 'Enter Password for sudo: ' sudoPW
#echo $sudoPW | sync; echo 3 | sudo -S tee /proc/sys/vm/drop_caches
#echo $sudoPW |sudo -S swapoff -a
#echo $sudoPW |sudo -S swapon -a

free_mem="$(free | grep 'Mem:' | awk '{print $7}')"
used_swap="$(free | grep 'Swap:' | awk '{print $3}')"

echo -e "Free memory:\t$free_mem kB ($((free_mem / 1024)) MiB)\nUsed swap:\t$used_swap kB ($((used_swap / 1024)) MiB)"
if [[ $used_swap -eq 0 ]]; then
    echo "Congratulations! No swap is in use."
elif [[ $used_swap -lt $free_mem ]]; then
    echo "Freeing swap..."
    sudo swapoff -a
    sudo swapon -a
else
    echo "Not enough free memory. Exiting."
    exit 1
fi
