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
  include irb
  include rbenv
  include ssh
  include vim
  include zsh
}
