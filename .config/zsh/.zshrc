if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OMZ config
export ZSH="/home/adel/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    archlinux
    git
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Android SDK
export ANDROID_SDK_ROOT='/home/adel/bin/android-sdk'
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_SDK_HOME=$ANDROID_SDK_ROOT

# Update PATH
path+='/home/adel/bin'
path+='/home/adel/src/flutter/bin'
path+='/home/adel/bin/android-sdk/tools/bin'
path+='/home/adel/bin/android-sdk/platform-tools'
path+='/home/adel/bin/robo3t/bin'
path+='/home/adel/bin/intellij-idea/bin'
export PATH

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vs='sudo systemctl restart libvirtd.service'
alias f='free -hw'

# Map CapsLock to Escape for Vim
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Timewarrior completions
if [[ ! -f ~/.config/zsh/timew ]]; then
    silent !curl -fLo ~/.config/zsh/timew https://raw.githubusercontent.com/lauft/timew-bashcompletion/master/timew
fi

source ~/.config/zsh/timew

# Vi-mode
bindkey -v

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
