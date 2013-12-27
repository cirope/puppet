#!/usr/bin/env bash

if [ ! -f /usr/bin/puppet ]; then
  if   [ $ARCHLINUX ]; then RUN=archlinux.sh
  elif [ $DEBIAN ];    then RUN=debian.sh
  elif [ $REDHAT ];    then RUN=redhat.sh
  fi

  source /etc/puppet/tools/install/$RUN
fi
