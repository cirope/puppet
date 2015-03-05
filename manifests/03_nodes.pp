node default {
  include baseclass

  case $::hostname {
    web:      { include role::web }
    app:      { include role::app }
    db:       { include role::db }
    default:  { include role::all }
  }
}
