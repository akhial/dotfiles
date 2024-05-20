#!/bin/zsh

# Completions
autoload -Uz compinit promptinit
compinit
promptinit

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.hist
setopt INC_APPEND_HISTORY_TIME

PROMPT='%F{blue}%~%f %(!.#.$) '

# Alias definitions
# General
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias c='clear'
alias cat='bat'
alias vim='nvim'
alias f='free -hw'
alias l='eza -la'
alias ls='eza'
alias e='neovide'
alias x='ps x'
alias ktlint='ktlint --disabled_rules=no-blank-line-before-rbrace'
# Docker
alias dcb='docker compose build'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcr='docker compose run'
alias dcrr='docker compose restart'
alias ds='sudo systemctl restart docker'
alias dsac='docker container stop $(docker container ls -aq)'
alias drmac='dsac && docker container prune -f'
alias dcln='drmac && docker volume prune -f'
# Git
alias ga='git add'
alias gaa='git add *'
alias gdl='git clone --depth=1'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log'
# Zsh
alias zcfg='vim /home/adel/.zshrc'
alias zsrc='source /home/adel/.zshrc'

# Vi-mode
bindkey -v

path+="/usr/local/bin"
path+="/home/adel/.npm/bin"
path+="/home/adel/.local/bin"
path+="/home/adel/.cargo/bin"
path+="/home/adel/Documents/Flutter/bin"

# Start SSH Agent automatically
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -s > "${HOME}/.ssh-agent-env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(cat "${HOME}/.ssh-agent-env")" >/dev/null
fi

# Add SSH key
ssh-add -q ~/.ssh/moushtari-ec2.pem 2>/dev/null

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/adel/.local/share/zsh/plugins/zsh-window-title/zsh-window-title.zsh
