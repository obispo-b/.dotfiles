## How to setup

1. Define alias 
```shell
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
2. Clone the repo
```shell
git clone --bare https://github.com/obispo-b/.dotfiles.git ~/.cfg
```
3. Checkout content to home
```shell
cfg checkout
```
4. In case of this error remove listed files
```shell
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .zshrc
Please move or remove them before you can switch branches.
Aborting
```
