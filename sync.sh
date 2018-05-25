rsync ~/.irbrc $DOTFILES/irbrc --inplace
rsync ~/envrc $DOTFILES/envrc --inplace
rsync ~/.agignore $DOTFILES/agignore --inplace
rsync ~/.vimrc $DOTFILES/vimrc --inplace
rsync ~/.zshrc $DOTFILES/zshrc --inplace
rsync ~/.aliases $DOTFILES/aliases --inplace
rsync ~/.tmux.conf $DOTFILES/tmux.conf --inplace
rsync -r ~/.tmux-layouts/ $DOTFILES/.tmuxifier-layouts --inplace
rsync ~/.tmux.conf $DOTFILES/.tmux.conf --inplace
rsync ~/.gitconfig $DOTFILES/gitconfig --inplace
rsync ~/.gitignore_global $DOTFILES/gitignore_global --inplace

rsync ~/.atom/config.cson $DOTFILES/atom/config.cson --inplace
rsync ~/.atom/github.cson $DOTFILES/atom/github.cson --inplace
rsync ~/.atom/init.coffee $DOTFILES/atom/init.coffee --inplace
rsync ~/.atom/keymap.cson $DOTFILES/atom/keymap.cson --inplace
rsync ~/.atom/packages.list $DOTFILES/atom/packages.list --inplace
rsync ~/.atom/snippets.cson $DOTFILES/atom/snippets.cson --inplace
rsync ~/.atom/styles.less $DOTFILES/atom/styles.less --inplace

rsync -d ~/.vim/plugged/vim-nerdtree-syntax-highlight/after/syntax/nerdtree.vim $DOTFILES/.vim/plugged/vim-nerdtree-syntax-highlight/after/syntax/nerdtree.vim --inplace

rsync -r ~/.vim/custom/ $DOTFILES/.vim/custom/ --inplace
