class user::root {
  user { 'root':
    ensure  => present,
    shell   => '/bin/zsh',
    require => Package['zsh']
  }

  user::vimconfig { 'root':
    user => 'root',
    home => '/root'
  }

  user::zsh { 'root':
    user => 'root',
    home => '/root'
  }
}
