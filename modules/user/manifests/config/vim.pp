define user::config::vim(
  $user,
  $group = $user,
  $home  = "/home/${user}"
) {
  file { "${home}/.vimrc":
    ensure  => file,
    owner   => $user,
    group   => $group,
    require => [User[$user], Package['vim-nox']],
    source  => 'puppet:///modules/user/vim/.vimrc'
  }

  file { "${home}/.vim":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => User[$user]
  }

  file { "${home}/.vim/backup":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => File["${home}/.vim"]
  }

  file { "${home}/.vim/undodir":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => File["${home}/.vim"]
  }
}
