class user::deployer::rbenv {
  $ruby_version = '2.2.2'

  rbenv::install { 'deployer':
    group   => $user::deployer::group,
    require => [
      User::Dotfiles::Gem[$user::deployer::username],
      User::Dotfiles::Zsh[$user::deployer::username]
    ]
  }

  rbenv::compile { $ruby_version:
    user    => $user::deployer::username,
    group   => $user::deployer::group,
    global  => true,
    require => Rbenv::Install['deployer']
  }

  rbenv::plugin { 'rbenv-gem-rehash':
    user   => $user::deployer::username,
    group  => $user::deployer::group,
    source => 'git://github.com/sstephenson/rbenv-gem-rehash.git'
  }
}
