# Andriod SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Oh my zsh stuff
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

ZSH_THEME="minimal"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='eza -algHS'
alias cat='bat'
alias vs='code .'
alias src='source ~/.zshrc'
alias grep='grep --color'
alias pn='pnpm'

# Starship stuff
export STARSHIP_CONFIG="$HOME/.starship.toml"
eval "$(starship init zsh)"
