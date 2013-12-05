class deployer::gem {
  file { 'gemrc':
    path    => "$deployer::home/.gemrc",
    ensure  => file,
    owner   => $deployer::user,
    group   => $deployer::group,
    mode    => 0644,
    require => User[$deployer::user],
    source  => 'puppet:///modules/deployer/gem/.gemrc'
  }
}
