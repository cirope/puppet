#!/usr/bin/env bash

if   [ -f /etc/arch-release ];   then export ARCHLINUX=true
elif [ -f /etc/debian_version ]; then export DEBIAN=true
elif [ -f /etc/redhat-release ]; then export REDHAT=true
fi
