## How to setup

1. Define alias 
```bash
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
2. Clone the repo
```bash
git clone --bare https://github.com/obispobruno/.dotfiles.git ~/.cfg
```
3. Checkout content to home
```bash
cfg checkout
```

4. Hide untracked files
```bash
cfg config --local status.showUntrackedFiles no
```

- In case of this error remove listed files
```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .zshrc
Please move or remove them before you can switch branches.
Aborting
```
