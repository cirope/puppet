ZSH=$HOME/.oh-my-zsh
ZSH_THEME="philips"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Rbenv path overide
export PATH="$HOME/.rbenv/bin:$PATH"
[ ! -f "$HOME/.rbenv/bin/rbenv" ] || eval "$(rbenv init -)"

# Oh My ZSH plugins
plugins=(bundler gem git rails)

source $ZSH/oh-my-zsh.sh
