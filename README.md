# dotfiles

### Install Dropbox

### Add environment variable
```
export CONFIG_DIR = $HOME/Dropbox/Backups/dotfiles
```
### clone the latest code

```
git@github.com:measoutdam/dotfiles.git
````
### Add symlinks

```
cd ~
rsync ~/.agignore ${CONFIG_DIR}/agignore
rsync ~/.agignore ${CONFIG_DIR}/agignore
rsync ~/.vimrc ${CONFIG_DIR}/vimrc
rsync ~/.zshrc ${CONFIG_DIR}/zshrc
rsync -d ~/tmuxifier/templates ${CONFIG_DIR}/tmuxifier/templates
rsync -d ~/tmuxifier/layouts ${CONFIG_DIR}/tmuxifier/layouts
rsync ~/.gitconfig ${CONFIG_DIR}/gitconfig
rsync ~/.gitignore_global ${CONFIG_DIR}/gitignore_global
rsync ~/.gitignore ${CONFIG_DIR}/gitignore
rsync ~/.atom/config.cson $DOTFILES/atom/config.cson
rsync ~/.atom/github.cson $DOTFILES/atom/github.cson
rsync ~/.atom/init.coffee $DOTFILES/atom/init.coffee
rsync ~/.atom/keymap.cson $DOTFILES/atom/keymap.cson
rsync ~/.atom/packages.list $DOTFILES/atom/packages.list
rsync ~/.atom/snippets.cson $DOTFILES/atom/snippets.cson
rsync ~/.atom/styles.less $DOTFILES/atom/styles.less
```

# Inspired By
### VIM
https://github.com/rtorr/vim-cheat-sheet

https://github.com/jordanhudgens/vim-settings

https://github.com/samnang/dotfiles
