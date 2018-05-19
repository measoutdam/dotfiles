# If you come from bash you might have to change your $PATH.  export
# PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/Users/measoutdam/.oh-my-zsh
export ZSHRC=/Users/measoutdam/.zshrc
export VIMRC=/Users/measoutdam/.vimrc
export DOTFILES=~/Dropbox/Backups/dotfiles
export TERM=xterm-256color
export OTP_ENCRYPTION_KEY=tf4hxybh4gp2bi737x4v7qvp4vt3jgax
# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
  git
  warhol
)

source $ZSH/oh-my-zsh.sh
export EDITOR=nvim
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export PATH=$PATH:/Users/measoutdam/bin/
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="$HOME/.tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
eval "$(tmuxifier init -)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

#########################
# Plugins Customization #
#########################
# Custom POWERLEVEL9K Theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_RBENV_BACKGROUND="green"
