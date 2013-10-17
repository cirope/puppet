class users {
  user { 'deployer':
    comment    => 'Deployer',
    ensure     => present,
    managehome => true,
    home       => '/home/deployer',
    shell      => '/bin/zsh',
    gid        => 'www-data',
    groups     => [ 'admin' ],
    require    => Group['admin']
  }
}
