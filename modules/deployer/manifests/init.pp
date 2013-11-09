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
    require    => [Group[$group, 'admin'], Package['zsh']]
  }

  include apps_root
  include gem
  include rbenv
  include vim
  include zsh
}
