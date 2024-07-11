# .bashrc

# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
alias fpki="flatpak install"
alias fpks="flatpak search"
alias fpkr="flatpak uninstall"
alias fpkl="flatpak list"
alias fpku="flatpak update"
alias dnfu="sudo dnf upgrade" 
alias dnfi="sudo dnf install"
alias dnfs="dnf search"
alias dnfinf="dnf info"
alias qw="setxkbmap us && setxkbmap -model 'asus_laptop'"
