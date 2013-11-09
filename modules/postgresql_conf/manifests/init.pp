class postgresql_conf {
  class { 'postgresql::globals':
    encoding => 'UTF8',
    locale   => 'es_AR.utf8'
  }

  class { 'postgresql::server':
    require => [Exec['sysctl'], Package['language-pack-es']]
  }

  include db
  include hba
  include conf

  Class['postgresql::globals'] -> Class['postgresql::server'] -> Postgresql::Server::Db[$db::db]
}
