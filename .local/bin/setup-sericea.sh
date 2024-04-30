#!/usr/bin/env bash

just install-brew

brew install \
	git \
	vim \
	ncdu \
	rust \
	tmux \
	htop \
	wget \
	curl \
	gcc \
	neovim \
	npm \
	ripgrep \
	fd \
	fzf \
	bat \
	eza \
	fastfetch \
	p7zip \
	procs \
	btop \
	syncthing \
	zoxide \
	gh \
	lf \
	unzip \
	unar \
	trash-cli \
	tldr \
	ghc \
	haskell-language-server \
	yazi \
	starship

git clone https://github.com/obispobruno/nvim-config.git ~/.config/nvim
git clone --bare https://github.com/obispobruno/.dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

git clone https://github.com/obispobruno/BigBagKbdTrixXKB.git /tmp/BigBagKbdTrixXKB
/tmp/BigBagKbdTrixXKB/install-dreymar-xmod.sh

mkdir -p ~/.local/share/fonts
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
7z x ~/.local/share/fonts/JetBrainsMono.zip -o$HOME/.local/share/fonts

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.config/zsh/plugins/zsh-autocomplete
