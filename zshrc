# If you come from bash you might have to change your $PATH.  export
# PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/Users/measoutdam/.oh-my-zsh
export ZSHRC=/Users/measoutdam/.zshrc
export VIMRC=/Users/measoutdam/.vimrc
export DOTFILES=~/Dropbox/Backups/dotfiles
export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
# export TERM=screen-256color       # for a tmux -2 session (also for screen)
export OTP_ENCRYPTION_KEY=00a423caa01fdc733b93a3fa1e81c128577fd4b43b9a18b79eee092e129a30947caca06fd488fe13c5f438766fe0c7ed875f5d448cd1d4d1a990a3913d27376d
# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
  git
)
eval `gdircolors ~/.oh-my-zsh/custom/plugins/dircolors-solarized/dircolors.ansi-dark`
source $ZSH/oh-my-zsh.sh

# Envinronment path
export EDITOR=vim
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export PATH=$PATH:/Users/measoutdam/bin/
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"

export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
eval "$(tmuxifier init -)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Plugin
eval "$(direnv hook zsh)"
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
