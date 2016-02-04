define user::dotfiles::zsh(
  $user,
  $group = $user,
  $home  = "/home/${user}"
) {
  $oh_my_zsh_path = "${home}/.oh-my-zsh"
  $oh_my_zsh_repo = 'https://github.com/robbyrussell/oh-my-zsh.git'

  file { "${home}/.zshrc":
    ensure  => file,
    owner   => $user,
    group   => $group,
    require => User[$user],
    source  => 'puppet:///modules/user/dotfiles/zshrc',
  }

  exec { "${user}_ohmyzsh":
    command => "git clone ${oh_my_zsh_repo} ${oh_my_zsh_path}",
    user    => $user,
    creates => $oh_my_zsh_path,
    timeout => 100,
    cwd     => $home,
    require => [User[$user], Package['git']]
  }
}
