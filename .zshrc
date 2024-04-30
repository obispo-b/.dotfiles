source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

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

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/opts.zsh 
export EDITOR=nvim
export PATH="$PATH:/home/bruno/.local/bin"
export PATH="$PATH:/home/bruno/.cargo/bin"
export PATH="$PATH:/var/lib/flatpak/exports/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export XDG_DOWNLOAD_DIR="/home/bruno/Downloads/"
