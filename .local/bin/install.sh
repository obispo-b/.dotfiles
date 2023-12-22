#!/bin/bash

set -e
set -x

sudo hostnamectl set-hostname "bruno"

faster_dnf="fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True"

echo "$faster_dnf" | sudo tee -a /etc/dnf/dnf.conf >/dev/null

sudo dnf upgrade -y

yes | sudo dnf copr enable pennbauman/ports
yes | sudo dnf copr enable petersen/haskell-language-server

sudo dnf install -y \
	git \
	vim \
	zsh \
	tmux \
	htop \
	wget \
	curl \
	gcc \
	g++ \
	python3 \
	python3-pip \
	neovim \
	npm \
	ripgrep \
	fd-find \
	fzf \
	bat \
	xclip \
	xsel \
	neofetch \
	p7zip \
	p7zip-plugins \
	zathura \
	zathura-pdf-poppler \
	sxiv \
	flatpak \
	alacritty \
	scrot \
	rofi \
	onedrive \
	playerctl \
	syncthing \
	zoxide \
	gh \
	lf \
	unzip \
	unrar \
	kitty \
	kitty-terminfo \
	trash-cli \
	tldr \
	ghc \
	haskell-language-server \
	pandoc \
	texlive

rm -rf ~/.config
rm -rf ~/.local/bin
rm -rf ~/.local/share/nvim
rm -rf ~/.bashrc
rm -rf ~/.zshrc
rm -rf ~/.dotfiles
rm -rf ~/Downloads/BigBagKbdTrixXKB

git clone https://github.com/obispobruno/nvim-config.git ~/.config/nvim
git clone --bare https://github.com/obispobruno/.dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no


git clone https://github.com/DreymaR/BigBagKbdTrixXKB.git ~/Downloads/BigBagKbdTrixXKB
sudo ~/Downloads/BigBagKbdTrixXKB/install-dreymar-xmod.sh

mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip ~/.local/share/fonts
7z x ~/.local/share/fonts/JetBrainsMono.zip -o$HOME/.local/share/fonts

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

read -rp "Install flatpaks? [Y/n] " flat

if [[ $flat != 'n' ]]; then
	flatpak install -y com.github.tchx84.Flatseal \
		com.discordapp.Discord \
		org.cryptomator.Cryptomator \
		io.gitlab.librewolf-community \
		io.freetubeapp.FreeTube \
		com.tutanota.Tutanota \
		com.github.iwalton3.jellyfin-media-player \
		org.libreoffice.LibreOffice \
		org.keepassxc.KeePassXC \
		org.localsend.localsend_app \
		org.filezillaproject.Filezilla \
		com.github.IsmaelMartinez.teams_for_linux \
		com.github.xournalpp.xournalpp \
		com.valvesoftware.Steam \
		io.github.mimbrero.WhatsAppDesktop \
		io.mpv.Mpv \
		net.cozic.joplin_desktop \
		net.davidotek.pupgui2 \
		com.valvesoftware.Steam.CompatibilityTool.Proton-GE \
		org.pulseaudio.pavucontrol
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
