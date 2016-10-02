class user::deployer::sudoers {
  file { "/etc/sudoers.d/${user::deployer::username}":
    content => template('user/sudoers.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    require => User[$user::deployer::username]
  }
}
