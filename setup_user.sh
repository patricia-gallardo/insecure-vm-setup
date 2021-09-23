#!/bin/bash
set -e

#  export USER_PASSWORD=<password>
#  bash <(curl -s https://raw.githubusercontent.com/patricia-gallardo/insecure-vm-setup/main/setup_user.sh)

if [[ -z "$USER_PASSWORD" ]]; then
    echo "Must provide USER_PASSWORD in environment" 1>&2
    exit 1
fi

apt update
apt -y upgrade

useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' $USER_PASSWORD) training
usermod -a -G sudo training
usermod --shell /bin/bash training
sudo reboot
