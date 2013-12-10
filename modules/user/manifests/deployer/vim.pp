class user::deployer::vim {
  file { 'vimrc':
    path    => "${user::deployer::home}/.vimrc",
    ensure  => file,
    owner   => $user::deployer::user,
    group   => $user::deployer::group,
    require => [User[$user::deployer::user], Package['vim-nox']],
    source  => 'puppet:///modules/user/vim/.vimrc'
  }

  file { 'vimdir':
    path    => "${user::deployer::home}/.vim",
    ensure  => directory,
    owner   => $user::deployer::user,
    group   => $user::deployer::group,
    require => User[$user::deployer::user]
  }

  file { "${user::deployer::home}/.vim/backup":
    ensure  => directory,
    owner   => $user::deployer::user,
    group   => $user::deployer::group,
    require => File['vimdir']
  }

  file { "${user::deployer::home}/.vim/undodir":
    ensure  => directory,
    owner   => $user::deployer::user,
    group   => $user::deployer::group,
    require => File['vimdir']
  }
}
