if has('vim_starting')
  if has('win32') || has('win64')
  elseif has('unix')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
endif

call neobundle#rc()

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tomasr/molokai'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'kana/vim-submode'

" vim-quickrun
let g:quickrun_config={'*': {'split': ''}}
set splitbelow