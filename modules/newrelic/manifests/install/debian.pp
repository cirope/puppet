class newrelic::install::debian {
  apt::source { 'newrelic':
    ensure   => present,
    location => 'http://apt.newrelic.com/debian/',
    release  => 'newrelic',
    repos    => 'non-free',
    require  => Package['wget'],
    key      => {
      id     => '548C16BF',
      source => 'http://download.newrelic.com/548C16BF.gpg'
    },
    include  => {
      src => false
    }
  }

  package { 'newrelic-sysmond':
    ensure  => present,
    require => Apt::Source['newrelic']
  }
}
