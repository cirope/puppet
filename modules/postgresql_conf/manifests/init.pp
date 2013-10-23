class postgresql_conf {
  $memory = inline_template("<%= @memorysize_mb.to_i %>")

  class { 'postgresql::global':
    encoding => 'UTF8',
    locale   => 'es_AR'
  }

  class { 'postgresql::server': }

  postgresql::server::pg_hba_rule { 'allow users to connect locally':
    type        => 'local',
    database    => 'all',
    user        => 'all',
    auth_method => 'md5'
  }

  postgresql::server::config_entry { 'max_connections':
    value => '50'
  }

  postgresql::server::config_entry { 'shared_buffers':
    value => "${$memory / 4}MB"
  }

  postgresql::server::config_entry { 'work_mem':
    value => "${$memory / 512}MB"
  }

  postgresql::server::config_entry { 'maintenance_work_mem':
    value => "${$memory / 64}MB"
  }

  postgresql::server::config_entry { 'checkpoint_segments':
    value => '10'
  }

  postgresql::server::config_entry { 'checkpoint_completion_target':
    value => '0.9'
  }

  postgresql::server::config_entry { 'random_page_cost':
    value => '2.0'
  }

  postgresql::server::config_entry { 'effective_cache_size':
    value => "${$memory / 2}MB"
  }

  postgresql::server::config_entry { 'log_min_error_statement':
    value => 'error'
  }

  postgresql::server::config_entry { 'log_min_duration_statement':
    value => '1000'
  }

  postgresql::server::config_entry { 'log_line_prefix':
    value => "'%t:%r:%u@%d:[%p]: '"
  }

  postgresql::server::config_entry { 'log_temp_files':
    value => '1024'
  }

  postgresql::server::config_entry { 'lc_messages':
    value => "'$locale'"
  }

  postgresql::server::config_entry { 'lc_monetary':
    value => "'$locale'"
  }

  postgresql::server::config_entry { 'lc_numeric':
    value => "'$locale'"
  }

  postgresql::server::config_entry { 'lc_time':
    value => "'$locale'"
  }

  postgresql::server::config_entry { 'default_text_search_config':
    value => "'pg_catalog.spanish'"
  }
}
