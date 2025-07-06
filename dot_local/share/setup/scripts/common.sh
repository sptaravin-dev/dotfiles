#!/usr/bin/env bash

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export ZSH_CONFIG_DIR="$XDG_CONFIG_HOME/zsh"
export ZSH_PLUGINS_DIR="$ZSH_CONFIG_DIR/plugins"
