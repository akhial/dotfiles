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

# Android SDK
export ANDROID_SDK_ROOT='/home/adel/bin/android-sdk'
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_SDK_HOME=$ANDROID_SDK_ROOT

# Update PATH
path+='/home/adel/bin'
export PATH

# Alias definitions
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias f='free -hw'
alias gdl='git clone --depth=1'
alias l='ls -lah --color'
alias ls='ls --color'
alias vimzsh='vim ~/.config/zsh/.zshrc'
alias vs='sudo systemctl restart libvirtd.service'
alias zshsrc='source ~/.config/zsh/.zshrc'

# Vi-mode
bindkey -v

# Install community/zsh-syntax-highlighting
# Install community/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

