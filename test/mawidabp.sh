MODULEPATH="/etc/puppet/modules:$HOME/.puppet/modules:$(dirname $0)/../modules"
CONFDIR="$(dirname $0)/.."

FACTER_hostname=mawidabp \
  FACTER_fqdn=mawidabp.com \
  FACTER_ipaddress=127.0.0.1 \
  puppet apply --modulepath $MODULEPATH --confdir $CONFDIR --noop manifests/site.pp
