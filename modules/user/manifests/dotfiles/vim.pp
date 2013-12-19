define user::dotfiles::vim(
  $user,
  $group = $user,
  $home  = "/home/${user}"
) {
  $vimpackage = $::osfamily ? {
    debian => 'vim-nox',
    redhat => 'vim-enhanced'
  }

  file { "${home}/.vimrc":
    ensure  => file,
    owner   => $user,
    group   => $group,
    require => [User[$user], Package[$vimpackage]],
    source  => 'puppet:///modules/user/dotfiles/vimrc'
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
