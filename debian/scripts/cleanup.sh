#!/bin/bash

set -e
set -x

sudo apt-get clean
sudo rm /etc/discover-pkginstall.conf
rm -rf /home/vagrant/VBoxGuestAdditions.iso
