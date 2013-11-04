class vhost {
  nginx::resource::vhost { $fqdn:
    ensure                    => present,
    server_name               => [$fqdn],
    listen_port               => 443,
    www_root                  => "/var/www/$fqdn/current/public",
    ssl                       => true,
    ssl_cert                  => "/var/lib/$fqdn/ssl/certs/$fqdn.pem",
    ssl_key                   => "/var/lib/$fqdn/ssl/private_keys/$fqdn.pem",
    ssl_port                  => 443,
    ssl_protocols             => 'TLSv1 TLSv1.1 TLSv1.2',
    ssl_ciphers               => '"EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS"',
    vhost_cfg_append          => {
      'passenger_enabled' => 'on',
      'passenger_ruby'    => "$deployer::home/.rbenv/versions/$rbenv::ruby_version/bin/ruby"
    }
  }
}
