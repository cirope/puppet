class ssh {
  $franco_rsa = 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD34cQ6DpxqkEvivkW07GnwlEeCAtnwxMhZs7TreWP20cDTOqAtoKN1LhIBAhu7OUyHJw2kof6u5t3ObTJJDGMoqMBZgp7y8vD1UjPimgD4NsLTx0nwU/K5Mn/gL64Dab8LEk+x9rpYsxN/48AXvElIhjaGOUR0Iemif20uqopgOxq9sO6PeWpYRU1o8ox286gIF4LLoeOmlUmwNtko9o/v+LFPRXwoj8hUNU2JzlI2AuYpEiYXDGIdqN8nvoIFjw7ZvuVSCEw7YI12itP4xkL52F6GnibnLCAAM3sheFwvW/Ftx02v1iOxaJ2ZRxSTLwfh54WCs6QSQLTq3ftjmncx'
  $franco_mba_rsa = 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDZJE4D5VRy7ujWCYpUiifgae7P9n0fNN2oIzdh15hggpSyY0lcqMRU3OOkZE1acVQratrlc3dzJ5bIi6EcVcImPP2xcUyA8YTeogyIEYfDwlJRo/+NqVjumV4y5DFSDZafWy8EKUgZ7mBnFtt98kPwnO7ZPa79KB/qwqOi//TFXK9oC9+a/7stR6VF5OWxz6rOZRhVItAA5wZ+US1kW3NrX6AUBVhsqUzeMSvO2sfZHveJWYsYfpCR6Aw6I0Khxh39Or9G05r0xPTd4mvTtrUVddeDDCcjEDaoXmTFDYSsyNMVHoSj41yddtk8kILOyFc/dP6is25yVUm3v0fLuztx'

  ssh_authorized_key { "franco_$deployer::user":
    ensure  => present,
    key     => $franco_rsa,
    type    => rsa,
    user    => $deployer::user,
    require => User[$deployer::user]
  }

  ssh_authorized_key { "franco_mba_$deployer::user":
    ensure  => present,
    key     => $franco_mba_rsa,
    type    => rsa,
    user    => $deployer::user,
    require => User[$deployer::user]
  }

  ssh_authorized_key { 'franco_root':
    ensure => present,
    key    => $franco_rsa,
    type   => rsa,
    user   => root
  }
}
