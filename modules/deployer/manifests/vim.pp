class vim {
  file { '.vimrc':
    path    => "$deployer::home/.vimrc",
    ensure  => file,
    require => Package['vim-nox'],
    source  => "puppet:///modules/deployer/vim/.vimrc"
  }
}
