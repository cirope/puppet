class newrelic::install::debian {
  apt::source { 'newrelic':
    ensure      => present,
    location    => 'http://apt.newrelic.com/debian/',
    release     => 'newrelic',
    repos       => 'non-free',
    key         => '548C16BF',
    key_source  => 'http://download.newrelic.com/548C16BF.gpg',
    include_src => false,
    require     => Package['wget']
  }

  package { 'newrelic-sysmond':
    ensure  => present,
    require => Apt::Source['newrelic']
  }
}
