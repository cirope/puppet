class deployer {
  $user = 'deployer'
  $home = "/home/$user"

  user { $user:
    ensure     => present,
    managehome => true,
    home       => $home,
    shell      => '/bin/zsh',
    gid        => 'www-data',
    groups     => [ 'admin' ],
    require    => Group['admin']
  }

  include zsh
  include vim
  include rbenv
}
