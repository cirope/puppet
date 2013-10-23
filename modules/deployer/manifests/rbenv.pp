class rbenv {
  $ruby_version = '2.0.0-p247'

  rbenv::install { 'deployer':
    group   => $deployer::group,
    require => File['zshrc']
  }

  rbenv::compile { $ruby_version:
    user    => $deployer::user,
    group   => $deployer::group,
    global  => true,
    bundler => absent,
    require => Rbenv::Install['deployer']
  }

  rbenv::gem { 'bundler':
    ensure => present,
    user   => $deployer::user,
    ruby   => $ruby_version
  }
}
