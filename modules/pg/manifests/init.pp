class pg {
  class { 'postgresql::globals':
    encoding => 'UTF8',
    locale   => 'es_AR.utf8'
  }

  class { 'postgresql::server':
    require => [Exec['sysctl'], Package['language-pack-es']]
  }

  include pg::create
  include pg::hba
  include pg::conf

  Class['postgresql::globals'] -> Class['postgresql::server']
}
