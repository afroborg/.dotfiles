# Overrides
alias ls='eza -algHS'
alias cat='bat'
alias grep='grep --color'
alias mkdir='mkdir -p'
alias vim='nvim'
alias vi='nvim'
alias ..='cd ..'
alias ...='cd ../..'

# Dev
alias pn='pnpm'
alias vs='code .'

# Utilities
alias src='source ~/.zshrc'

# Load any custom local configurations if they exist
if [[ -f ~/.alias.local ]]; then
  # shellcheck source=/home/alias.local
  source ~/.alias.local
fi
