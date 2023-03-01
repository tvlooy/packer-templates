#!/bin/sh

set -e
set -x

echo "puffy.vagrantup.com" > /etc/myname

cat <<EOF > /etc/doas.conf
permit nopass vagrant
EOF

# Vagrant uses sudo options that are not compatible with doas
pkg_add sudo--
cat <<EOF > /etc/sudoers

#includedir /etc/sudoers.d
EOF
mkdir /etc/sudoers.d
cat <<EOF > /etc/sudoers.d/vagrant
Defaults:vagrant !requiretty
vagrant ALL=(ALL) NOPASSWD: ALL
EOF
chmod 440 /etc/sudoers.d/vagrant

