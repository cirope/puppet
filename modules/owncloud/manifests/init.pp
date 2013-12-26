class owncloud {
  include owncloud::install
  include owncloud::datadir
  include owncloud::db
}
