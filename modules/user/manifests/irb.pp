define user::irb(
  $user,
  $group = $user,
  $home  = "/home/${user}"
) {
  file { "${home}/.irbrc":
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => 0644,
    require => User[$user],
    source  => 'puppet:///modules/user/irb/.irbrc'
  }
}
