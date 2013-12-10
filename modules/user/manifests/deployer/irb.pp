class user::deployer::irb {
  file { 'irbrc':
    path    => "${user::deployer::home}/.irbrc",
    ensure  => file,
    owner   => $user::deployer::username,
    group   => $user::deployer::group,
    mode    => 0644,
    require => User[$user::deployer::username],
    source  => 'puppet:///modules/user/irb/.irbrc'
  }
}
