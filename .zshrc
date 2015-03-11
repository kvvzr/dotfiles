source $HOME/dotfiles/.zshrc.all

case ${OSTYPE} in
    darwin*)
        source $HOME/dotfiles/.zshrc.osx
        ;;
    linux*)
        source $HOME/dotfiles/.zshrc.linux
        ;;
esac

# plugin
source $HOME/dotfiles/.zsh/chpwd.sh
source $HOME/dotfiles/.zsh/git-prompt.sh
source $HOME/dotfiles/z/z.sh

# zsh-syntax-highlighting
source $HOME/dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
