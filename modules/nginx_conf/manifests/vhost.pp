nginx::resource::vhost { $fqdn:
  ensure                    => present,
  server_name               => [$fqdn],
  listen_port               => 443,
  send_file                 => 'on',
  www_root                  => "/var/www/$fqdn/current/public",
  ssl                       => true,
  ssl_cert                  => "/var/lib/$fqdn/ssl/certs/$fqdn.pem",
  ssl_key                   => "/var/lib/$fqdn/ssl/private_keys/$fqdn.pem",
  ssl_port                  => 443,
  ssl_cache                 => 'shared:SSL:128m',
  ssl_ciphers               => 'SSLv2:-LOW:-EXPORT:RC4+RSA',
  ssl_session_timeout       => '5m',
  ssl_protocols             => 'TLSv1 TLSv1.1 TLSv1.2',
  ssl_prefer_server_ciphers => 'on',
  ssl_session_cache         => 'shared:SSL:10m',
  ssl_ciphers               => '"EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS"',
  gzip                      => 'on',
  gzip_disable              => 'msie6',
  gzip_vary                 => 'on',
  gzip_proxied              => 'any',
  gzip_comp_level           => '6',
  gzip_buffers              => '16 8k',
  gzip_http_version         => '1.1',
  gzip_types                => 'text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript',
  vhost_cfg_append          => {
    'passenger_enabled' => 'on',
    'passenger_ruby'    => "$deployer::home/.rbenv/versions/$rbenv::ruby_version/bin/ruby"
  },
  passenger_cgi_param       => {
    'SSL_CLIENT_S_DN'   => '$ssl_client_s_dn',
    'SSL_CLIENT_VERIFY' => '$ssl_client_verify',
  }
}
