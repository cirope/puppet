class user::deployer::zsh {
  $oh_my_zsh_path = "${user::deployer::home}/.oh-my-zsh"
  $oh_my_zsh_repo = 'git://github.com/robbyrussell/oh-my-zsh.git'

  file { 'zshrc':
    path    => "${user::deployer::home}/.zshrc",
    ensure  => file,
    require => User[$user::deployer::user],
    source  => 'puppet:///modules/user/zsh/.zshrc',
  }

  exec { 'ohmyzsh':
    command => "git clone ${oh_my_zsh_repo} ${oh_my_zsh_path}",
    user    => $user::deployer::user,
    creates => $oh_my_zsh_path,
    timeout => 100,
    cwd     => $user::deployer::home,
    require => [User[$user::deployer::user], Package['git']]
  }
}
