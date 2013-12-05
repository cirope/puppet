class deployer::apps_root {
  file { $vars::apps_root:
    ensure  => directory,
    owner   => $deployer::user,
    group   => $deployer::group,
    require => User[$deployer::user]
  }
}
