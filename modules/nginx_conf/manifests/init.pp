class nginx_conf {
  class { 'nginx': }

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template('nginx_conf/nginx.conf.erb')
  }
}
