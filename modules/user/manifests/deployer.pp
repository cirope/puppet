class user::deployer {
  $username = 'deployer'
  $group    = 'www-data'
  $home     = "/home/${username}"

  user { $username:
    ensure     => present,
    managehome => true,
    home       => $home,
    gid        => $group
  }

  user::config::gem { $username:
    user  => $username,
    group => $group
  }

  user::config::irb { $username:
    user  => $username,
    group => $group
  }

  user::config::vim { $username:
    user  => $username,
    group => $group
  }

  user::config::zsh { $username:
    user => $username
  }

  user::ssh { $username:
    user => $username
  }

  include user::deployer::apps_root
  include user::deployer::rbenv
}
