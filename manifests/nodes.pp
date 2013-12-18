node default {
  include baseclass

  case $::hostname {
    web:     { include server::web }
    app:     { include server::app }
    db:      { include server::db }
    php:     { include server::php }
    default: { include server::all }
  }
}
