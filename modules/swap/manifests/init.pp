class swap($file = '/mnt/swapfile') {
  $memory_in_bytes = $vars::memory * 1024 * 1024

  exec { 'create_swap_file':
    command => "fallocate -l ${memory_in_bytes} ${file}; mkswap ${file}; swapon ${file}",
    user    => 'root',
    creates => $file
  }

  file { $file:
    mode => '0600'
  }

  mount { $file:
    ensure  => present,
    name    => 'none',
    device  => $file,
    fstype  => 'swap',
    options => 'sw'
  }
}
