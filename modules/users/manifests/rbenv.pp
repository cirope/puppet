class rbenv {
  $ruby_version = '2.0.0-p247'

  rbenv::install { 'deployer':
    require => User['deployer']
  }

  rbenv::compile { $ruby_version:
    user => 'deployer',
    require => Rbenv::Install['deployer']
  }
}
