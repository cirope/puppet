class user::root {
  user { 'root':
    ensure  => present,
    shell   => '/bin/zsh',
    require => Package['zsh']
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
    source => 'puppet:///modules/user/.root_profile'
  }
}
