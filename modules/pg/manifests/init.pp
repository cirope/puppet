class pg {
  $require = $::osfamily ? {
    archlinux => [Exec['sysctl'], Exec['locale-gen']],
    debian    => [Exec['sysctl'], Exec['locale-gen']],
    redhat    => [Exec['sysctl'], Exec['localedef']]
  }

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.5',
    encoding            => 'UTF8',
    locale              => 'es_AR.utf8'
  }

  class { 'postgresql::server':
    require => $require
  }

  Class['postgresql::globals'] -> Class['postgresql::server']

  include pg::create
  include pg::hba
  include pg::conf
}
