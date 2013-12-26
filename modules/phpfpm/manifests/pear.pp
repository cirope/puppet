class phpfpm::pear {
  include pear

  pear::package { 'zendopcache':
    repository => 'pecl.php.net'
  }
}
