class hba {
  postgresql::server::pg_hba_rule { 'allow users to connect locally':
    type        => 'local',
    database    => 'all',
    user        => 'all',
    auth_method => 'md5',
    order       => '001'
  }
}
