# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit promptinit
compinit
promptinit

source ~/src/powerlevel10k/powerlevel10k.zsh-theme

# History
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

# Update PATH
path+='/home/adel/bin'
export PATH

# Alias definitions
alias ..='cd ..'
alias ...='cd ../..'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias f='free -hw'
alias gdl='git clone --depth=1'
alias l='ls -lah --color'
alias ls='ls --color'
alias mvn="mvn -s $XDG_CONFIG_HOME/maven/settings.xml"
alias vim='nvim'
alias vs='sudo systemctl restart libvirtd.service'
alias x='ps x'
alias zshconfig='vim ~/.config/zsh/.zshrc'
alias zshsrc='source ~/.config/zsh/.zshrc'

# Vi-mode
bindkey -v

# Install community/zsh-syntax-highlighting
# Install community/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

