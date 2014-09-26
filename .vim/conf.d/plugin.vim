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
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tomasr/molokai'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'kana/vim-submode'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundleCheck

let g:vimfiler_as_default_explorer=1
let g:choosewin_blink_on_land = 0
" vim-quickrun
let g:quickrun_config={'*': {'split': ''}}
set splitbelow

" rspec
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s', 'outputter': 'buffer:filetype=rspec-result', 'filetype': 'rspec-result'}
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

