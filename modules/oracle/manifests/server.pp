class oracle::server(
  $base          = '/var/oracle',
  $home          = '/var/oracle/product/11.2/db',
  $version       = '11.2.0.4',
  $user          = 'oracle',
  $group         = 'dba',
  $group_install = 'oinstall',
  $group_oper    = 'oper',
  $type          = 'SE',
  $download      = '/install'
) {
  include oracle::server::user
  include oracle::server::dependencies
  include oracle::server::config
  include oracle::server::install
  include oracle::server::listener
  include oracle::server::db
}
