class swap {
  $file = '/mnt/swapfile'

  exec { 'create_swap_file':
    command => "fallocate -l ${vars::memory}m $file; mkswap $file; swapon $file",
    user    => 'root',
    creates => $file
  }

  file { $file:
    mode => 600
  }

  mount { $file:
    name    => 'none',
    ensure  => present,
    device  => $file,
    fstype  => 'swap',
    options => 'sw'
  }
}
