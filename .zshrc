source /home/linuxbrew/.linuxbrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/opts.zsh 

bindkey -v

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export EDITOR=nvim
export PATH="$PATH:/home/bruno/.local/bin"
export PATH="$PATH:/home/bruno/.cargo/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/linuxbrew/.linuxbrew/opt/binutils/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/dotnet@6/bin:$PATH"
export HOMEBREW_AUTO_UPDATE_SECS=3600
