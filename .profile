#!/bin/sh

# QT stuff
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=gnome
export QT_STYLE_OVERRIDE=kvantum

# Editor
export EDITOR=/usr/bin/vim

# Firefox smooth scroll
export MOZ_USE_XINPUT2=1

# Calibre dark mode
export CALIBRE_USE_DARK_PALETTE=1

# Tidy ~
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export TIMEWARRIORDB="$XDG_CONFIG_HOME"/timewarrior
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# fcitx
#export XMODIFIERS=@im=fcitx
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx

