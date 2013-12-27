PACKAGE=puppetlabs-release-precise.deb
SERVER=http://apt.puppetlabs.com/

apt-get install -y wget

wget $SERVER$PACKAGE
dpkg -i $PACKAGE
rm $PACKAGE

apt-get install -y -o Dpkg::Options::="--force-confold" puppet
