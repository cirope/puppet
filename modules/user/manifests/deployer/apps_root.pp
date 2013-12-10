class user::deployer::apps_root {
  file { $vars::apps_root:
    ensure  => directory,
    owner   => $user::deployer::user,
    group   => $user::deployer::group,
    require => User[$user::deployer::user]
  }
}
