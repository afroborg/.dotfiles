
# Aliases
alias ls='ls -la -G'
alias vs='code .'
alias src='source ~/.zshrc'
alias grep='grep --color'


# Env variables
export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG='/Users/axelfroborg/.starship.toml'

# Oh My Zsh
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Starship stuff
eval "$(starship init zsh)"

# Asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh
