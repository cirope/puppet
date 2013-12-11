class user::root {
  user { 'root':
    ensure => present
  }

  user::ssh { 'root':
    user => 'root'
  }

  user::config::vim { 'root':
    user => 'root',
    home => '/root'
  }

  user::config::zsh { 'root':
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
