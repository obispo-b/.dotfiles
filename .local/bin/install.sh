#!/bin/bash

read -rp "Sure? [y/N]: " sure

if [[ $sure != 'y' ]]; then
	exit 0
fi

set -e
set -x

# sudo hostnamectl set-hostname ""

faster_dnf="fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True"

echo "$faster_dnf" | sudo tee -a /etc/dnf/dnf.conf >/dev/null

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf upgrade -y

yes | sudo dnf copr enable pennbauman/ports
yes | sudo dnf copr enable petersen/haskell-language-server

sudo dnf install -y \
	git \
	vim \
	ncdu \
	zsh \
	cargo \
	rust \
  rust-analyzer \
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
  eza \
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
  grim \
  wlr-randr \
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

curl -sS https://starship.rs/install.sh | sh

rm -rf ~/.config
rm -rf ~/.local/bin
rm -rf ~/.local/share/nvim
rm -rf ~/.bashrc
rm -rf ~/.zshrc
rm -rf ~/.dotfiles
rm -rf ~/Downloads/BigBagKbdTrixXKB
rm -rf ~/README.md

git clone https://github.com/obispobruno/nvim-config.git ~/.config/nvim
git clone --bare https://github.com/obispobruno/.dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

git clone https://github.com/DreymaR/BigBagKbdTrixXKB.git ~/Downloads/BigBagKbdTrixXKB
sudo ~/Downloads/BigBagKbdTrixXKB/install-dreymar-xmod.sh

mkdir -p ~/.local/share/fonts
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
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
		org.pulseaudio.pavucontrol \
    org.qbittorrent.qBittorrent
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.config/zsh/plugins/zsh-autocomplete

pip install yewtube
