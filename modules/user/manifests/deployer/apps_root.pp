class user::deployer::apps_root {
  file { $vars::apps_root:
    ensure  => directory,
    owner   => $user::deployer::username,
    group   => $user::deployer::group,
    require => User[$user::deployer::username]
  }
}
