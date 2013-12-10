class user::deployer {
  $user  = 'deployer'
  $group = 'www-data'
  $home  = "/home/${user}"

  user { $user:
    ensure     => present,
    managehome => true,
    home       => $home,
    shell      => '/bin/zsh',
    gid        => $group,
    require    => Package['zsh']
  }

  include user::deployer::apps_root
  include user::deployer::gem
  include user::deployer::irb
  include user::deployer::rbenv
  include user::deployer::ssh
  include user::deployer::zsh

  user::vimconfig { $user:
    user  => $user,
    group => $group
  }
}
