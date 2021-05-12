#!/bin/bash
set -e

#  export USER_PASSWORD=<password>
#  bash <(curl -s https://raw.githubusercontent.com/patricia-gallardo/insecure-vm-setup/main/setup.sh)

apt update
apt upgrade

adduser -p $USER_PASSWORD training
usermod -a -G sudo training
sudo reboot
