class vim {
  file { '.vimrc':
    path    => '/home/deployer/.vimrc',
    ensure  => file,
    require => Package['vim-nox'],
    source  => "puppet:///modules/users/vim/.vimrc"
  }
}
