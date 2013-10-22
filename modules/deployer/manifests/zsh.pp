class zsh {
  $oh_my_zsh_path = "$deployer::home/.oh-my-zsh"

  file { '.zshrc':
    path    => "$deployer::home/.zshrc",
    ensure  => file,
    require => User[$deployer::user],
    source  => 'puppet:///modules/deployer/zsh/.zshrc',
  }

  exec { 'ohmyzsh':
    command => "git clone git://github.com/robbyrussell/oh-my-zsh.git $oh_my_zsh_path",
    user    => $deployer::user,
    creates => $oh_my_zsh_path,
    timeout => 100,
    cwd     => $deployer::home,
    require => [User[$deployer::user], Package['git']]
  }
}
