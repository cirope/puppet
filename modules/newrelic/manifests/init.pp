class newrelic($license = undef) {
  if $license {
    include newrelic::install

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
      content => inline_template('newrelic/nrsysmond.cfg.erb'),
      notify  => Service['newrelic-sysmond'],
      require => Package['newrelic-sysmond']
    }
  }
}
