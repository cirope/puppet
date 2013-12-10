class user::deployer::gem {
  file { 'gemrc':
    path    => "${user::deployer::home}/.gemrc",
    ensure  => file,
    owner   => $user::deployer::user,
    group   => $user::deployer::group,
    mode    => 0644,
    require => User[$user::deployer::user],
    source  => 'puppet:///modules/user/gem/.gemrc'
  }
}
