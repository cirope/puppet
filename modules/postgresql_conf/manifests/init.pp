class postgresql_conf {
  $memory = inline_template("<%= @memorysize_mb.to_i %>")

  class { 'postgresql::server':
    encoding        => 'UTF8',
    locale          => 'es_AR',
    manage_firewall => false
  }

  postgresql::server::pg_hba_rule { 'allow users to connect locally':
    type        => 'local',
    database    => 'all',
    user        => 'all',
    auth_method => 'md5'
  }

  postgresql::server::config_entry { 'max_connections':
    value => '50',
  }

  postgresql::server::config_entry { 'shared_buffers':
    value => "${$memory / 4}MB",
  }
}
