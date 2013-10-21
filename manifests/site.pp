Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

node default {
  include swap
  include groups
  include deployer
  include ssh
  include packages
  include services
}
