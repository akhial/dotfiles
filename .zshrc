#!/bin/zsh

# Completions
autoload -Uz compinit promptinit
compinit
promptinit

source <(kubectl completion zsh)

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.hist
setopt INC_APPEND_HISTORY_TIME

PROMPT='%F{blue}%~%f %(!.#.->) '

# Alias definitions
# General
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias c='clear'
alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias f='free -hw'
alias ktlint='ktlint --disabled_rules=no-blank-line-before-rbrace'
alias l='exa -la'
alias ls='exa'
alias vim='nvim'
alias vs='sudo systemctl restart libvirtd.service'
alias x='ps x'
# Clipboard
alias xcopy='xsel --clipboard --input'
alias xpaste='xsel --clipboard --output'
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
alias gl='git log'
# Zsh
alias zcfg='vim /home/adel/.zshrc'
alias zsrc='source /home/adel/.zshrc'

function dpgd () {
    docker compose run --rm $1 bash -c "cd /var/lib/postgresql/data && tar czf - ."
}

function dpgr {
    docker compose run --rm -v $2:/backup/:ro $1 bash -c "cd /var/lib/postgresql/data && rm -rf * && tar xf /backup/db.gz"
}

# Vi-mode
bindkey -v

path+="/usr/local/bin"
path+="/home/adel/bin"
path+="/home/adel/bin/flutter/bin"
path+="/home/adel/.local/bin"
path+="/home/adel/.local/bin/detekt/bin"
path+="/home/adel/.cargo/bin"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
