class vim {
  file { 'vimrc':
    path    => "$deployer::home/.vimrc",
    ensure  => file,
    owner   => $deployer::user,
    group   => $deployer::group,
    require => [User[$deployer::user], Package['vim-nox']],
    source  => 'puppet:///modules/deployer/vim/.vimrc'
  }

  file { 'vimdir':
    path    => "$deployer::home/.vim",
    ensure  => directory,
    owner   => $deployer::user,
    group   => $deployer::group,
    require => User[$deployer::user]
  }

  file { "$deployer::home/.vim/backup":
    ensure  => directory,
    owner   => $deployer::user,
    group   => $deployer::group,
    require => File['vimdir']
  }

  file { "$deployer::home/.vim/undodir":
    ensure  => directory,
    owner   => $deployer::user,
    group   => $deployer::group,
    require => File['vimdir']
  }
}
