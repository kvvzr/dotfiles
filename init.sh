#!/bin/sh

cd $HOME/dotfiles

git submodule update --init

for dotfiles in .?*; do
    case $dotfiles in 
        .. | .git* | .vim | .zsh)
            continue;;
        *)
            ln -Fis "$PWD/$dotfiles" $HOME;;
    esac
done

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > .zsh/git-prompt.sh
curl https://gist.githubusercontent.com/yonchu/3935922/raw/751f9d0de255681772ac523630e5e1d479b87274/chpwd_for_zsh.sh > .zsh/chpwd.sh

echo "done"
