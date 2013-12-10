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

  user::gem { $username:
    user  => $username,
    group => $group
  }

  user::vimconfig { $username:
    user  => $username,
    group => $group
  }

  user::zsh { $username:
    user => $username
  }

  include user::deployer::apps_root
  include user::deployer::irb
  include user::deployer::rbenv
  include user::deployer::ssh
}
