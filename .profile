#!/bin/sh

# Editor
export EDITOR=vim

# Chrome
export CHROME_EXECUTABLE=chromium

# Android SDK
export ANDROID_SDK_ROOT="$HOME"/bin/android
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_SDK_HOME=$ANDROID_SDK_ROOT

# Firefox smooth scroll
export MOZ_USE_XINPUT2=1

# Calibre dark mode
export CALIBRE_USE_DARK_PALETTE=1

# Tidy ~
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export TIMEWARRIORDB="$XDG_CONFIG_HOME"/timewarrior
export HISTFILE="$XDG_DATA_HOME"/zsh/.histfile
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

