class user::deployer::rbenv {
  $ruby_version = '2.0.0-p353'

  rbenv::install { 'deployer':
    group   => $user::deployer::group,
    require => [
      User::Config::Gem[$user::deployer::username],
      User::Config::Zsh[$user::deployer::username]
    ]
  }

  rbenv::compile { $ruby_version:
    user    => $user::deployer::username,
    group   => $user::deployer::group,
    global  => true,
    require => [Rbenv::Install['deployer'], Package['libreadline-dev']]
  }

  rbenv::plugin { 'rbenv-gem-rehash':
    user    => $user::deployer::username,
    group   => $user::deployer::group,
    source  => 'git://github.com/sstephenson/rbenv-gem-rehash.git'
  }
}
