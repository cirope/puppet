class environment {
  file { '/etc/environment':
    source => 'puppet:///modules/system/environment',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }
}
