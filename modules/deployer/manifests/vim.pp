class vim {
  file { "$deployer::home/.vimrc":
    ensure  => file,
    owner   => $deployer::user,
    group   => $deployer::group,
    require => Package['vim-nox'],
    source  => "puppet:///modules/deployer/vim/.vimrc"
  }

  file { "$deployer::home/.vim/backup":
    ensure => directory,
    owner  => $deployer::user,
    group  => $deployer::group
  }

  file { "$deployer::home/.vim/undodir":
    ensure => directory,
    owner  => $deployer::user,
    group  => $deployer::group
  }
}
