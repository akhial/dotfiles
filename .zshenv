#!/bin/zsh

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinit/xinitrc

# Development variables
#export SALEOR_API_URL="http://localhost:8000/graphql/"
export SALEOR_API_URL="https://demo.saleor.io/graphql/"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx $XINITRC
fi

emulate sh -c ". $HOME/.profile"
