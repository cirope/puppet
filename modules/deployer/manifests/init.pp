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
    require    => Package['zsh']
  }

  include deployer::apps_root
  include deployer::gem
  include deployer::irb
  include deployer::rbenv
  include deployer::ssh
  include deployer::vim
  include deployer::zsh
}
