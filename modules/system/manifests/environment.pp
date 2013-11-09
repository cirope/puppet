class environment {
  file { 'environment':
    path   => '/etc/environment',
    source => 'puppet:///modules/system/environment',
    owner  => root,
    group  => root,
    mode   => 0644
  }
}
