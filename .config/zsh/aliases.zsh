#!/bin/zsh

# Flatpak
alias fpki="flatpak install"
alias fpks="flatpak search"
alias fpkr="flatpak uninstall"
alias fpkl="flatpak list"
alias fpkla="flatpak list --app"
alias fpku="flatpak update"

# dnf
alias dnfi="sudo dnf install"
alias dnfs="dnf search"
alias dnfp="dnf provides"
alias dnfr="sudo dnf remove"
alias dnfu="sudo dnf upgrade"
alias dnfur="sudo dnf upgrade --refresh"
alias dnfcu="dnf check-update"

# General
alias v="nvim"
alias code="flatpak run com.visualstudio.code"
alias qw="setxkbmap us && setxkbmap -model 'asus_laptop'"
alias w='wl-copy'
alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias cat='bat'
alias ls='exa'
alias la='exa -la'
alias ll='exa -l'
alias l='exa -l'
