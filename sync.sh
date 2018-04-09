cd ~
rsync ~/.agignore $DOTFILES/agignore --inplace
rsync ~/.vimrc $DOTFILES/vimrc --inplace
rsync ~/.zshrc $DOTFILES/zshrc --inplace
rsync -d ~/tmuxifier/templates $DOTFILES/tmuxifier/templates --inplace
rsync -d ~/tmuxifier/layouts $DOTFILES/tmuxifier/layouts --inplace
rsync ~/.gitconfig $DOTFILES/gitconfig --inplace
rsync ~/.gitignore_global $DOTFILES/gitignore_global --inplace
rsync ~/.atom/config.cson $DOTFILES/atom/config.cson --inplace
rsync ~/.atom/github.cson $DOTFILES/atom/github.cson --inplace
rsync ~/.atom/init.coffee $DOTFILES/atom/init.coffee --inplace
rsync ~/.atom/keymap.cson $DOTFILES/atom/keymap.cson --inplace
rsync ~/.atom/packages.list $DOTFILES/atom/packages.list --inplace
rsync ~/.atom/snippets.cson $DOTFILES/atom/snippets.cson --inplace
rsync ~/.atom/styles.less $DOTFILES/atom/styles.less --inplace
