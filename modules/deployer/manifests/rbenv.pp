class rbenv {
  $ruby_version = '2.0.0-p247'

  rbenv::install { 'deployer':
    group   => $deployer::group,
    require => File['zshrc', 'gemrc']
  }

  rbenv::compile { $ruby_version:
    user    => $deployer::user,
    group   => $deployer::group,
    global  => true,
    require => [Rbenv::Install['deployer'], Package['libreadline-dev']]
  }

  rbenv::gem { 'unicorn':
    user    => $deployer::user,
    ruby    => $ruby_version,
    require => Rbenv::Compile[$ruby_version]
  }
}
