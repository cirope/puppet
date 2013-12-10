class user::deployer::rbenv {
  $ruby_version = '2.0.0-p353'

  rbenv::install { 'deployer':
    group   => $user::deployer::group,
    require => File["${user::deployer::home}/.zshrc", 'gemrc']
  }

  rbenv::compile { $ruby_version:
    user    => $user::deployer::user,
    group   => $user::deployer::group,
    global  => true,
    require => [Rbenv::Install['deployer'], Package['libreadline-dev']]
  }

  rbenv::plugin { 'rbenv-gem-rehash':
    user    => $user::deployer::user,
    group   => $user::deployer::group,
    source  => 'git://github.com/sstephenson/rbenv-gem-rehash.git'
  }
}
