set rtp+=$HOME/dotfiles/.vim/
runtime! conf.d/*.vim

filetype plugin indent on
autocmd FileType * setlocal formatoptions-=ro
