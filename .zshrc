# all
export PATH=/usr/local/bin:$HOME/bin:$PATH
export CC=/usr/bin/gcc

export GIT_MERGE_AUTOEDIT=no
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
export LESSHISTFILE=-

setopt extended_history
setopt hist_ignore_dups
setopt correct
setopt auto_pushd
setopt auto_cd
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt pushd_ignore_dups
setopt list_packed
setopt re_match_pcre
setopt prompt_subst
setopt hist_save_no_dups
setopt prompt_subst
setopt transient_rprompt
setopt print_eight_bit
setopt extended_glob
setopt globdots
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt

export EDITOR=vim
bindkey -e

autoload -Uz colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias s='ls'
alias rm='rmtrash'
alias cp='cp -i'
alias mv='mv -i'
alias claer='clear'
alias vf='vim -c "VimFiler -split -simple -winwidth=35 -toggle -no-quit -auto-cd"'

# keybind
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# ruby
export RBENV_ROOT=/usr/local/var/rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

alias be='bundle exec'

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export PYTHONDONTWRITEBYTECODE=1
eval "$(pyenv init -)"

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH

# go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# mysql
export PATH=$PATH:/usr/local/mysql/bin

# Melete
alias pmid="ls -lt | awk 'NR == 2 {print \$9}' | xargs timidity"
alias omid="ls -lt | awk 'NR == 2 {print \$9}' | xargs open"

# plugin
source $HOME/dotfiles/.zsh/chpwd.sh
source $HOME/dotfiles/.zsh/git-prompt.sh
source $HOME/dotfiles/z/z.sh

# pylearn2
export PYLEARN2_DATA_PATH=$HOME/dataset
export PYLEARN2_VIEWER_COMMAND='open -Wn'

# completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# prompt
PROMPT="%U%B%{$fg[cyan]%} %~ %{$reset_color%}%u%b"
PROMPT+="%U%(?.%{$fg[green]%}.%{$fg[magenta]%}) $ %{$reset_color%}%u "
SPROMPT="$suggest %r? [y,n,a,e] "

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_DESCRIBE_STYLE="default"
GIT_PS1_SHOWCOLORHINTS=1

precmd() {
    RPROMPT="%U%B%{$fg[yellow]%}"$(__git_ps1 %s)"%{$reset_color%}%u%b"
}

search() {
    find . -name "*${2}" -print | xargs grep --color=always -nir "${1}" | less -R
}

# zsh-syntax-highlighting
source $HOME/dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
