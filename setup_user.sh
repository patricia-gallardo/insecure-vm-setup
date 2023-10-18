#!/bin/bash
set -e

#  export USER_PASSWORD=<password>
#  bash <(curl -s https://raw.githubusercontent.com/patricia-gallardo/insecure-vm-setup/main/setup_user.sh)

if [[ -z "$USER_PASSWORD" ]]; then
    echo "Must provide USER_PASSWORD in environment" 1>&2
    exit 1
fi

echo "Update Droplet" 1>&2
apt update
apt -y upgrade

echo "Add user" 1>&2
useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' $USER_PASSWORD) training
usermod -a -G sudo training
usermod --shell /bin/bash training

echo "Reboot" 1>&2
sudo reboot
