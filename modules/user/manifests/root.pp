class user::root {
  user { 'root':
    ensure         => present,
    home           => '/root',
    shell          => '/bin/zsh',
    purge_ssh_keys => true,
    require        => Package['zsh']
  }

  user::ssh { 'root':
    user => 'root'
  }

  user::dotfiles::tmux { 'root':
    user => 'root',
    home => '/root'
  }

  user::dotfiles::vim { 'root':
    user => 'root',
    home => '/root'
  }

  user::dotfiles::zsh { 'root':
    user => 'root',
    home => '/root'
  }

  file { '/root/.profile':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/user/dotfiles/root_profile'
  }
}
