rsync ~/.agignore $DOTFILES/agignore --inplace
rsync ~/.vimrc $DOTFILES/vimrc --inplace
rsync ~/.zshrc $DOTFILES/zshrc --inplace
rsync ~/.aliases $DOTFILES/aliases --inplace
rsync ~/.tmux.conf $DOTFILES/tmux.conf --inplace
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

rsync -d ~/.vim/plugged/vim-devicons/plugin/webdevicons.vim $DOTFILES/.vim/plugged/vim-devicons/plugin/webdevicons.vim --inplace
rsync -d ~/.vim/plugged/vim-nerdtree-syntax-highlight/after/syntax/nerdtree.vim $DOTFILES/.vim/plugged/vim-nerdtree-syntax-highlight/after/syntax/nerdtree.vim --inplace

rsync -d ~/.vim/custom/ctrlp.vim $DOTFILES/.vim/custom/ctrlp.vim --inplace
rsync -d ~/.vim/custom/neomake.vim $DOTFILES/.vim/custom/neomake.vim --inplace
rsync -d ~/.vim/custom/nerdtree.vim $DOTFILES/.vim/custom/nerdtree.vim --inplace
rsync -d ~/.vim/custom/tmux-line.vim $DOTFILES/.vim/custom/tmux-line.vim --inplace
rsync -d ~/.vim/custom/vim-airline.vim $DOTFILES/.vim/custom/vim-airline.vim --inplace
rsync -d ~/.vim/custom/vim-devicons.vim $DOTFILES/.vim/custom/vim-devicons.vim --inplace
rsync -d ~/.vim/custom/vim-indent-guides.vim $DOTFILES/.vim/custom/vim-indent-guides.vim --inplace
rsync -d ~/.vim/custom/vim-operator-flashy.vim $DOTFILES/.vim/custom/vim-operator-flashy.vim --inplace
rsync -d ~/.vim/custom/vim-startify.vim $DOTFILES/.vim/custom/vim-startify.vim --inplace
