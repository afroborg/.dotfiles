
# Aliases
alias ls='ls -la -G'
alias vs='code .'
alias src='source ~/.zshrc'
alias grep='grep --color'

# Env variables
export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG="$HOME/.starship.toml"

# Oh My Zsh
ZSH_THEME="agnoster"
plugins=(git asdf)
source $ZSH/oh-my-zsh.sh

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# Starship stuff
eval "$(starship init zsh)"
