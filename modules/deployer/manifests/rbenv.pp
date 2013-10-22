class rbenv {
  $ruby_version = '2.0.0-p247'

  rbenv::install { 'deployer':
    group   => $deployer::group,
    require => User[$deployer::user]
  }

  rbenv::compile { $ruby_version:
    user    => $deployer::user,
    global  => true,
    require => Rbenv::Install['deployer']
  }
}
