class phpfpm::install {
  package { 'php-apc':
    ensure => present
  }

  package { 'php5-cli':
    ensure => present
  }

  package { 'php5-curl':
    ensure => present
  }

  package { 'php5-fpm':
    ensure => present
  }

  package { 'php5-gd':
    ensure => present
  }

  package { 'php5-intl':
    ensure => present
  }

  package { 'php5-pgsql':
    ensure => present
  }

  package { 'php5-xmlrpc':
    ensure => present
  }
}
