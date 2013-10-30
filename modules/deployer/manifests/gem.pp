class gem {
  file { 'gemrc':
    path    => "$deployer::home/.gemrc",
    ensure  => file,
    owner   => $deployer::user,
    group   => $deployer::group,
    require => User[$deployer::user],
    source  => 'puppet:///modules/deployer/.gemrc'
  }
}
