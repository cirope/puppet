class swap($file = '/mnt/swapfile') {
  $memory_in_kb = $::vars::memory * 1024

  exec { 'create_swap_file':
    command => "dd if=/dev/zero of=${file} bs=1024 count=${memory_in_kb}; mkswap ${file}; swapon ${file}",
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
