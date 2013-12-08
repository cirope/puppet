class newrelic($license = undef) {
  if $license {
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

    service { 'newrelic-sysmond':
      enable  => true,
      ensure  => running,
      require => Package['newrelic-sysmond']
    }

    file { '/etc/newrelic/nrsysmond.cfg':
      ensure  => file,
      owner   => root,
      group   => newrelic,
      mode    => 0640,
      content => template('newrelic/nrsysmond.cfg.erb'),
      notify  => Service['newrelic-sysmond'],
      require => Package['newrelic-sysmond']
    }
  }
}
