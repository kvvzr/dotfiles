export HISTCONTROL=ignoredoth
export HISTIGNORE="fg*:bg*:cd*:history*:ls*:clear*"
export HISTTIMEFORMAT='%Y/%m/%d %T : '
export LESSHISTFILE=-

export PATH=/usr/local/bin:$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

source ~/.dotfiles/.bash-powerline.sh
source ~/.dotfiles/.acd_func.sh
source ~/.dotfiles/.git-completion.bash

export HOMEBREW_CACHE=~/Library/Caches/Homebrew

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s dotglob

alias ls='ls -hG'
alias la='ls -a'
alias ll='ls -la'
alias a='./a.out'
alias v='vim'
alias ql='qlmanage -p "$@" >& /dev/null'
alias rh='runhaskell'

auto_cdls()
{
	if [ "$OLDPWD" != "$PWD" ]; then
		ls
		OLDPWD="$PWD"
	fi
}
PROMPT_COMMAND="$PROMPT_COMMAND"$'\n'auto_cdls

