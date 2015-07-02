define user::dotfiles::bashrc(
  $user,
  $group = $user,
  $home  = "/home/${user}"
) {
  file { "${home}/.bashrc":
    ensure  => file,
    owner   => $user,
    group   => $group,
    require => User[$user],
    source  => 'puppet:///modules/user/dotfiles/bashrc',
  }
}
