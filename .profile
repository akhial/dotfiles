#!/bin/bash

# Locale
export LANG=en_US.UTF-8

# Shell
export SHELL=/bin/zsh

# Editor
export EDITOR=nvim

# Chrome
export CHROME_EXECUTABLE=chromium

# Android SDK
export ANDROID_SDK_ROOT=$HOME/bin/android
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_SDK_HOME=$ANDROID_SDK_ROOT

# Firefox smooth scroll
export MOZ_USE_XINPUT2=1

### Dashboard build
export API_URI=https://change.me:8000/
export APP_MOUNT_URI=/
export STATIC_URL=/

# QT theme
export QT_QPA_PLATFORMTHEME=gtk2

# Tidy ~
export XDG_DESKTOP_DIR=$HOME/
export XDG_MUSIC_DIR=$HOME/
export XDG_VIDEOS_DIR=$HOME/
export XDG_DOCUMENTS_DIR=$HOME/documents
export XDG_DOWNLOAD_DIR=$HOME/downloads
export XDG_PICTURES_DIR=$HOME/images
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java -Dawt.useSystemAAFontSettings=gasp"
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export HISTFILE=$XDG_DATA_HOME/zsh/.histfile
export R_LIBS_USER=$XDG_DATA_HOME/r
export SSB_HOME=$XDG_DATA_HOME/zoom
export TIMEWARRIORDB=$XDG_CONFIG_HOME/timewarrior
export WINEPREFIX=$XDG_DATA_HOME/wineprefixes/default
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

