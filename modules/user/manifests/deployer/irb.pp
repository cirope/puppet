class user::deployer::irb {
  file { 'irbrc':
    path    => "${user::deployer::home}/.irbrc",
    ensure  => file,
    owner   => $user::deployer::user,
    group   => $user::deployer::group,
    mode    => 0644,
    require => User[$user::deployer::user],
    source  => 'puppet:///modules/user/irb/.irbrc'
  }
}
