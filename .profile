#!/bin/sh

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim

# Firefox smooth scroll
export MOZ_USE_XINPUT2=1

# Tidy ~
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export TIMEWARRIORDB="$XDG_CONFIG_HOME"/timewarrior
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Android SDK
export ANDROID_SDK_ROOT='/home/adel/bin/android-sdk'
export ANDROID_HOME=$ANDROID_SDK_ROOT

# Update PATH
path+='/home/adel/src/flutter/bin'
path+='/home/adel/bin/android-sdk/tools/bin'
path+='/home/adel/bin/android-sdk/platform-tools'
export PATH
