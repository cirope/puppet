Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

node default {
  include vars
  include system
  include root
  include swap
  include groups
  include deployer
  include ssh
  include packages
  include services
  include postgresql_conf
  include nginx
  include unicorn
}
