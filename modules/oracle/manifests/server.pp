class oracle::server(
  $base = '/oracle',
  $home = '/oracle/product/11.2/db',
  $download = '/data/install'
) {
  include oracle::server::user
  include oracle::server::dependencies
  include oracle::server::config
  include oracle::server::install
  include oracle::server::listener
  include oracle::server::db
}
