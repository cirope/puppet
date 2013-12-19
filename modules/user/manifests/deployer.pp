class user::deployer {
  $username = 'deployer'
  $home     = "/home/${username}"
  $group    = $::osfamily ? {
    redhat  => 'nginx',
    default => 'www-data'
  }

  group { $group:
    ensure => present
  }

  user { $username:
    ensure     => present,
    managehome => true,
    home       => $home,
    gid        => $group,
    shell      => '/bin/zsh',
    require    => [Group[$group], Package['zsh']]
  }

  user::dotfiles::gem { $username:
    user  => $username,
    group => $group
  }

  user::dotfiles::irb { $username:
    user  => $username,
    group => $group
  }

  user::dotfiles::tmux { $username:
    user  => $username,
    group => $group
  }

  user::dotfiles::vim { $username:
    user  => $username,
    group => $group
  }

  user::dotfiles::zsh { $username:
    user  => $username,
    group => $group
  }

  user::ssh { $username:
    user => $username
  }

  include user::deployer::apps_root
  include user::deployer::rbenv
}
