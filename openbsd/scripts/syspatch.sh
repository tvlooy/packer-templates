#!/bin/ksh

set -e
set -x

if [[ `doas syspatch -c | wc -l | xargs` -gt 0 ]]; then

  # syspatch: cannot apply patches while reorder_kernel is running
  while [ true ]; do
    if pgrep -qxf '/bin/ksh .*reorder_kernel'; then
      sleep 10
    else
      break
    fi
  done

  doas syspatch

fi
