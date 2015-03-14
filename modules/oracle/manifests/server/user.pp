class oracle::server::user {
  group { 'oinstall':
    ensure => present
  }

  group { 'dba':
    ensure => present
  }

  group { 'oper':
    ensure => present
  }

  user { 'oracle' :
    ensure     => present,
    uid        => 500,
    gid        => 'oinstall',
    groups     => ['oinstall','dba','oper'],
    shell      => '/bin/bash',
    password   => '$1$DSJ51vh6$4XzzwyIOk6Bi/54kglGk3.',
    home       => '/home/oracle',
    comment    => 'This user oracle was created by Puppet',
    require    => Group['oinstall', 'dba', 'oper'],
    managehome => true
  }
}
