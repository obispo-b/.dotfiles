# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
  dnf
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

bindkey -v
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export EDITOR='nvim'
eval "$(zoxide init zsh)"
alias fpki="flatpak install"
alias fpks="flatpak search"
alias fpkr="flatpak uninstall"
alias fpkl="flatpak list"
alias fpku="flatpak update"
alias v="nvim"
alias qw="setxkbmap us && setxkbmap -model 'asus_laptop'"
alias w='wl-copy'
alias code="flatpak run com.visualstudio.code"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 

export PATH="$PATH:/home/bruno/.local/bin"
