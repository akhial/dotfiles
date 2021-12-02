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
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export HISTFILE="$XDG_DATA_HOME"/zsh/.histfile
export SSB_HOME="$XDG_DATA_HOME"/zoom
export TIMEWARRIORDB="$XDG_CONFIG_HOME"/timewarrior
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
