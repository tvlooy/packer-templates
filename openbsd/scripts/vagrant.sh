#!/bin/ksh

set -e
set -x

date | doas tee /etc/vagrant_box_build_time

mkdir -p ~/.ssh
ftp -o ~/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/authorized_keys
