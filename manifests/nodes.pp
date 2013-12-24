node 'cirope.com' {
  include baseclass
  include role::web
  include role::app
}

node default {
  include baseclass

  case $::hostname {
    web:      { include role::web }
    app:      { include role::app }
    db:       { include role::db }
    php:      { include role::php }
    owncloud: { include role::owncloud }
    default:  { include role::all }
  }
}
