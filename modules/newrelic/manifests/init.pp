class newrelic {
  apt::source { 'newrelic':
    ensure      => present,
    location    => 'http://apt.newrelic.com/debian/',
    release     => 'newrelic',
    repos       => 'non-free',
    key         => '548C16BF',
    key_server  => 'subkeys.pgp.net',
    include_src => false,
  }

  package { 'newrelic-sysmond':
    ensure  => present,
    require => Apt::Source['newrelic']
  }
}
