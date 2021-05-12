#!/bin/bash
set -e

#  export IP_ADDRESS=<ip>
#  export USER_PASSWORD=<password>
#  bash <(curl -s https://raw.githubusercontent.com/patricia-gallardo/insecure-vm-setup/main/test_user.sh)

if [[ -z "$IP_ADDRESS" ]]; then
    echo "Must provide IP_ADDRESS in environment" 1>&2
    exit 1
fi

if [[ -z "$USER_PASSWORD" ]]; then
    echo "Must provide USER_PASSWORD in environment" 1>&2
    exit 1
fi

sshpass -p $USER_PASSWORD ssh training@$IP_ADDRESS "echo $USER_PASSWORD | sudo -S apt update"
