# shellcheck shell=bash
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# shellcheck disable=SC2034
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)


# shellcheck disable=SC2034
plugins=(git debian zsh-autosuggestions)

# shellcheck disable=SC1091
source "$ZSH"/oh-my-zsh.sh

# Customize to your needs...

# alias vim=vimx

# export EDITOR=vimx

alias agpy='ag -G .py'
alias agjs='ag -G .js'
alias agml='ag -G .html'
alias agcss='ag -G .css'

alias dc='docker-compose `cat docker-compose.opt 2>/dev/null`'
alias dcu='dc up --build'
alias dcd='dc down --remove-orphans'
alias dcr='dc run --rm'

starship --version &>/dev/null && eval "$(starship init zsh)"

export PATH=~/.local/bin:~/dotfiles/bin:$PATH

if [ -f ~/.zshrc-extra ]; then
    # shellcheck disable=SC1090
    source ~/.zshrc-extra
fi

export WORKON_HOME=~/.virtualenvs

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    # shellcheck disable=SC1091
    source /usr/bin/virtualenvwrapper.sh
fi
