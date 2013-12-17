class pg {
  $require = $::osfamily ? {
    debian  => [Exec['sysctl'], Package['language-pack-es']],
    default => Exec['sysctl']
  }

  class { 'postgresql::globals':
    encoding => 'UTF8',
    locale   => 'es_AR.utf8'
  }

  class { 'postgresql::server':
    require => $require
  }

  Class['postgresql::globals'] -> Class['postgresql::server']

  include pg::create
  include pg::hba
  include pg::conf
}
