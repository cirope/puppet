node default {
  include baseclass

  case $::hostname {
    web:      { include role::web }
    db:       { include role::db }
    owncloud: { include role::owncloud }
    default:  { include role::php }
  }
}
