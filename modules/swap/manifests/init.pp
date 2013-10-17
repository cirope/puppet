class swap($file = '/mnt/swapfile') {
  if $memorysize_mb =~ /^\d+/ {
    exec { 'create_swap_file':
      command => "fallocate -l ${0}m ${file}; mkswap ${file}; swapon ${file}",
      user    => 'root',
      unless  => "test -f $file"
    }
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
