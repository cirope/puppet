class nginx_conf {
  class { 'nginx':
    package_source  => 'passenger',
    http_cfg_append => {
      'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
    }
  }

  include vhost
}
