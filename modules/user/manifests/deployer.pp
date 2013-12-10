class user::deployer {
  $username = 'deployer'
  $group    = 'www-data'
  $home     = "/home/${username}"

  user { $username:
    ensure     => present,
    managehome => true,
    home       => $home,
    shell      => '/bin/zsh',
    gid        => $group,
    require    => Package['zsh']
  }

  user::vimconfig { $username:
    group => $group
  }

  user::zsh { $username: }

  include user::deployer::apps_root
  include user::deployer::gem
  include user::deployer::irb
  include user::deployer::rbenv
  include user::deployer::ssh
}
