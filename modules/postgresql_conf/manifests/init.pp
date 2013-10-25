class postgresql_conf {
  class { 'postgresql::globals':
    encoding => 'UTF8',
    locale   => 'es_AR'
  }->

  class { 'postgresql::server':
    require => Package['language-pack-es']
  }

  include hba
  include conf
}
