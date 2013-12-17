class newrelic($license = undef) {
  if $license {
    case $operatingsystem {
      centos, redhat: { include newrelic::install::centos }
      debian, ubuntu: { include newrelic::install::ubuntu }
      default: { fail('Unrecognized operating system for newrelic') }
    }

    service { 'newrelic-sysmond':
      ensure  => running,
      enable  => true,
      require => Package['newrelic-sysmond']
    }

    file { '/etc/newrelic/nrsysmond.cfg':
      ensure  => file,
      owner   => 'root',
      group   => 'newrelic',
      mode    => '0640',
      content => template('newrelic/nrsysmond.cfg.erb'),
      notify  => Service['newrelic-sysmond'],
      require => Package['newrelic-sysmond']
    }
  }
}
