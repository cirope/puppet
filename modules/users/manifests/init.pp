class users {
  user { 'deployer':
    comment    => 'Deployer',
    ensure     => present,
    managehome => true,
    home       => '/home/deployer',
    gid        => 'www-data',
    groups     => [ 'admin' ],
    require    => Group['admin']
  }
}
