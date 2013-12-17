if [ ! -f /usr/bin/puppet ]; then
  if [ -f /etc/debian_version ]; then
    PACKAGE=puppetlabs-release-precise.deb
    SERVER=http://apt.puppetlabs.com/ 

    wget $SERVER$PACKAGE
    dpkg -i $PACKAGE
    rm $PACKAGE

    apt-get update
    apt-get install -y -o Dpkg::Options::="--force-confold" puppet
  elif [ -f /etc/redhat-release ]; then
    rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
  fi
fi
