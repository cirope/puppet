define user::config::tmux(
  $user,
  $group = $user,
  $home  = "/home/${user}"
){
  file { "${home}/.tmux.conf":
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    require => User[$user],
    source  => 'puppet:///modules/user/tmux/.tmux.conf'
  }
}
