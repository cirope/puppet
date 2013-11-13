class irb {
  file { 'irbrc':
    path    => "$deployer::home/.irbrc",
    ensure  => file,
    owner   => $deployer::user,
    group   => $deployer::group,
    mode    => 0644,
    require => User[$deployer::user],
    source  => 'puppet:///modules/deployer/irb/.irbrc'
  }
}
