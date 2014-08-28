export RBENV_ROOT=/usr/local/var/rbenv
export PATH=/usr/local/bin:$HOME/bin:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"
export CC=/usr/bin/gcc

source $HOME/.dotfiles/chpwd.sh
source $HOME/.dotfiles/git-prompt.sh

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

setopt correct
setopt auto_pushd
setopt auto_cd
setopt auto_param_slash
setopt auto_menu
setopt pushd_ignore_dups
setopt list_packed
setopt re_match_pcre
setopt prompt_subst
setopt hist_save_no_dups
setopt prompt_subst
setopt transient_rprompt

export EDITOR=~/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias rm='rmtrash'
alias cp='cp -i'
alias mv='mv -i'
alias be='bundle exec'
alias claer='clear'

autoload -Uz colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

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
  # local upstream=`echo $(__git_ps1 %s) | sed -e "s/u+\([0-9]*\)/up\1"/`
  RPROMPT="%U%B%{$fg[yellow]%}"$(__git_ps1 %s)"%{$reset_color%}%u%b"
}

source $HOME/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
