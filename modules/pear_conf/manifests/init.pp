class pear_conf {
  include pear

  pear::package { 'zendopcache':
    repository => 'pecl.php.net'
  }
}
