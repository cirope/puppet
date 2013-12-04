class newrelic {
  apt::source { 'newrelic':
    ensure      => present,
    location    => 'http://apt.newrelic.com/debian/',
    release     => 'newrelic',
    repos       => 'non-free',
    key         => '548C16BF',
    key_server  => 'https://download.newrelic.com/',
    include_src => false,
  }

  package { 'newrelic-sysmond':
    ensure  => present,
    require => Apt::Source['newrelic']
  }
}
