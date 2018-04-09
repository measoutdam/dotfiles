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
ln -s ~/.agignore ${CONFIG_DIR}/agignore
ln -s ~/.agignore ${CONFIG_DIR}/agignore
ln -s ~/.vimrc ${CONFIG_DIR}/vimrc
ln -s ~/.zshrc ${CONFIG_DIR}/zshrc
ln -s ~/tmuxifier/templates ${CONFIG_DIR}/tmuxifier/templates
ln -s ~/tmuxifier/layouts ${CONFIG_DIR}/tmuxifier/layouts
ln -s ~/.gitconfig ${CONFIG_DIR}/gitconfig
ln -s ~/.gitignore_global ${CONFIG_DIR}/gitignore_global
ln -s ~/.gitignore ${CONFIG_DIR}/gitignore
ln -s ~/.atom/config.cson $DOTFILES/atom/config.cson
ln -s ~/.atom/github.cson $DOTFILES/atom/github.cson
ln -s ~/.atom/init.coffee $DOTFILES/atom/init.coffee
ln -s ~/.atom/keymap.cson $DOTFILES/atom/keymap.cson
ln -s ~/.atom/packages.list $DOTFILES/atom/packages.list
ln -s ~/.atom/snippets.cson $DOTFILES/atom/snippets.cson
ln -s ~/.atom/styles.less $DOTFILES/atom/styles.less
```

# Inspired By
### VIM
https://github.com/rtorr/vim-cheat-sheet

https://github.com/jordanhudgens/vim-settings

https://github.com/samnang/dotfiles
