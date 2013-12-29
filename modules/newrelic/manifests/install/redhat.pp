class newrelic::install::redhat {
  package { 'newrelic-repo':
    ensure   => present,
    provider => 'rpm',
    source   => 'http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm'
  }

  package { 'newrelic-sysmond':
    ensure  => present,
    require => Package['newrelic-repo']
  }
}
