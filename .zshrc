
# Aliases
alias ls='eza -algHS'
alias cat='bat'
alias vs='code .'
alias src='source ~/.zshrc'
alias grep='grep --color'
alias pn='pnpm'

export STARSHIP_CONFIG="$HOME/.starship.toml"

# Starship stuff
eval "$(starship init zsh)"
