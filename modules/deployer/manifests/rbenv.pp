class rbenv {
  $ruby_version = '2.0.0-p247'

  rbenv::install { 'deployer':
    group   => $deployer::group,
    require => [File['zshrc'], Exec['ohmyzsh']]
  }

  rbenv::compile { $ruby_version:
    user    => $deployer::user,
    group   => $deployer::group,
    global  => true,
    require => Rbenv::Install['deployer']
  }
}
