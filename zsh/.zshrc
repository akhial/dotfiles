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

PROMPT='%F{blue}%~%f %(!.=>.->) '

# Alias definitions
# General
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias c='clear'
alias cdc='cd ~/Documents/Code/'
alias cat='bat'
alias vim='nvim'
alias l='eza -la --group-directories-first'
alias ls='eza'
# Docker
alias dcb='docker compose build'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dcr='docker compose run --rm'
alias dcrr='docker compose restart'
alias dr='docker run --rm'
alias dri='docker run -it --rm'
alias dcp='docker container prune -f'
alias dvp='docker volume prune -f'
alias dip='docker image prune -f'
alias dsac='docker container stop $(docker container ls -aq)'
# Git
alias ga='git add'
alias gaa='git add --all'
alias gcl='git clone'
alias gdl='git clone --depth=1'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias glg='git log'

# Vi-mode
bindkey -v

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(volta completions zsh)

