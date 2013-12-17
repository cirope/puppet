class newrelic::install::centos {
  package { 'newrelic-repo':
    ensure  => present,
    source  => 'http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm'
  }

  package { 'newrelic-sysmond':
    ensure  => present,
    require => Package['newrelic-repo']
  }
}
