class newrelic::install::archlinux {
  package { 'newrelic-sysmond':
    ensure  => present
  }
}
