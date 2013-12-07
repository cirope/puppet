class deployer::rbenv {
  $ruby_version = '2.0.0-p353'

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

  rbenv::plugin { 'rbenv-gem-rehash':
    user    => $deployer::user,
    source  => 'git://github.com/sstephenson/rbenv-gem-rehash.git',
    require => Rbenv::Compile[$ruby_version]
  }

  rbenv::gem { 'unicorn':
    user    => $deployer::user,
    ruby    => $ruby_version,
    require => Rbenv::Plugin['rbenv-gem-rehash']
  }
}
