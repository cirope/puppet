class swap {
  $file = '/mnt/swapfile'
  $size = $memorysize_mb ? { /^\d+/ => $0, default => 1024 }

  exec { 'create_swap_file':
    command => "fallocate -l ${size}m $file; mkswap $file; swapon $file",
    user    => 'root',
    creates => $file
  }

  file { $file:
    mode => 600
  }

  mount { $file:
    name  => 'none',
    ensure  => present,
    device  => $file,
    fstype  => 'swap',
    options => 'sw'
  }
}
