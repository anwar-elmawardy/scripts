#!/usr/bin/env bash
read -sp 'Enter Password for sudo: ' sudoPW
declare -a program_list=('skype' 'slack' 'discord' 'dropbox' 'teamviewer');

for program in "${program_list[@]}"
    do
        ./kill_process.sh "$program" "$sudoPW"
    done
