class ssh {
  $franco_rsa = 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD34cQ6DpxqkEvivkW07GnwlEeCAtnwxMhZs7TreWP20cDTOqAtoKN1LhIBAhu7OUyHJw2kof6u5t3ObTJJDGMoqMBZgp7y8vD1UjPimgD4NsLTx0nwU/K5Mn/gL64Dab8LEk+x9rpYsxN/48AXvElIhjaGOUR0Iemif20uqopgOxq9sO6PeWpYRU1o8ox286gIF4LLoeOmlUmwNtko9o/v+LFPRXwoj8hUNU2JzlI2AuYpEiYXDGIdqN8nvoIFjw7ZvuVSCEw7YI12itP4xkL52F6GnibnLCAAM3sheFwvW/Ftx02v1iOxaJ2ZRxSTLwfh54WCs6QSQLTq3ftjmncx'

  ssh_authorized_key { 'franco_deployer':
    ensure => present,
    key    => $franco_rsa,
    type   => rsa,
    user   => deployer
  }

  ssh_authorized_key { 'franco_root':
    ensure => present,
    key    => $franco_rsa,
    type   => rsa,
    user   => root
  }
}
