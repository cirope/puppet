class user::deployer::gem {
  file { 'gemrc':
    path    => "${user::deployer::home}/.gemrc",
    ensure  => file,
    owner   => $user::deployer::username,
    group   => $user::deployer::group,
    mode    => 0644,
    require => User[$user::deployer::username],
    source  => 'puppet:///modules/user/gem/.gemrc'
  }
}
