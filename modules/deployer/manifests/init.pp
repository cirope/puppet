class deployer {
  $user  = 'deployer'
  $group = 'www-data'
  $home  = "/home/$user"

  user { $user:
    ensure     => present,
    managehome => true,
    home       => $home,
    shell      => '/bin/zsh',
    gid        => $group,
    groups     => [ 'admin' ],
    require    => Group['admin']
  }

  include zsh
  include vim
  include rbenv
}