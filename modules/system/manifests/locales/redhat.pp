class system::locales::redhat {
  exec { 'localedef':
    command => 'localedef -i es_AR -f UTF-8 es_AR.UTF-8',
    unless  => 'locale -a | grep  es_AR.utf8'
  }
}
