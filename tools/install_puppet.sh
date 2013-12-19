if [ ! -f /usr/bin/puppet ]; then
  if [ -f /etc/arch-release ]; then
    sh /etc/puppet/tools/install/archlinux.sh
  elif [ -f /etc/debian_version ]; then
    sh /etc/puppet/tools/install/debian.sh
  elif [ -f /etc/redhat-release ]; then
    sh /etc/puppet/tools/install/redhat.sh
  fi
fi
