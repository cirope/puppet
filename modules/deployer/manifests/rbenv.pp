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

  rbenv::gem { 'unicorn':
    user    => $deployer::user,
    ruby    => $ruby_version,
    require => Rbenv::Compile[$ruby_version]
  }

  exec { 'rehash':
    command => "$deployer::home/.rbenv/bin/rbenv rehash",
    user    => $deployer::user,
    creates => "$deployer::home/.rbenv/shims/bundle",
    require => Rbenv::Gem["rbenv::bundler ${$deployer::user} ${ruby_version}"]
  }
}
