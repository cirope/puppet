define user::gem(
  $user,
  $group = $user,
  $home  = "/home/${user}"
){
  file { "${home}/.gemrc":
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => 0644,
    require => User[$user],
    source  => 'puppet:///modules/user/gem/.gemrc'
  }
}
