class owncloud::db(
  $database = 'owncloud',
  $user     = 'owncloud',
  $password = 'owncloud'
){
  pg::db { $database:
    database => $database,
    user     => $user,
    password => $password,
    require  => Package['owncloud']
  }
}
