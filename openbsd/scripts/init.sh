#!/bin/ksh

set -e
set -x

doas tee /etc/rc.conf.local <<EOF
sndiod_flags=NO
EOF

sed -e 's/\(ttyC[^0].*getty.*\)on /\1off/' /etc/ttys | doas tee /etc/ttys > /dev/null
