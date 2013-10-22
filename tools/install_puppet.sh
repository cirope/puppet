if [ ! -f /usr/bin/puppet ]; then
  PACKAGE=puppetlabs-release-precise.deb
  SERVER=http://apt.puppetlabs.com/ 

  wget $SERVER$PACKAGE
  dpkg -i $PACKAGE
  rm $PACKAGE

  apt-get update
  apt-get install -y puppet
fi
