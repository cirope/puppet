class nginx_conf {
  class { 'nginx':
    http_cfg_append => {
      'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
    }
  }

  include vhost
}
