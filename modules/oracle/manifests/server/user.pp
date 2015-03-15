class oracle::server::user {
  group { $oracle::server::group:
    ensure => present
  }

  group { $oracle::server::group_install:
    ensure => present
  }

  group { $oracle::server::group_oper:
    ensure => present
  }

  user { $oracle::server::user:
    ensure     => present,
    uid        => 500,
    gid        => $oracle::server::group_install,
    groups     => [$oracle::server::group, $oracle::server::group_install, $oracle::server::group_oper],
    shell      => '/bin/bash',
    password   => '$1$DSJ51vh6$4XzzwyIOk6Bi/54kglGk3.',
    home       => "/home/${oracle::server::user}",
    comment    => 'This user was created by Puppet',
    require    => Group[$oracle::server::group, $oracle::server::group_install, $oracle::server::group_oper],
    managehome => true
  }
}
