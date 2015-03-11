if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

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
NeoBundle 'tomasr/molokai'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'kana/vim-submode'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'wting/rust.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'jszakmeister/vim-togglecursor'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'derekelkins/agda-vim'
if has('lua')
    " NeoBundle 'Shougo/neocomplete'
    " NeoBundle 'Shougo/neosnippet'
    " NeoBundle 'Shougo/neosnippet-snippets'
endif
NeoBundleCheck

call neobundle#end()

"caw.vim(コメントアウト)のキーバインド
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

let g:indentLine_faster = 1

let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
" 'v'でファイルを開くときは右側に開く
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く
let g:netrw_alto = 1

augroup VimFiler
    autocmd Filetype vimfiler nunmap <buffer> -
augroup END

let g:choosewin_blink_on_land = 0
" vim-quickrun
let g:quickrun_config={'*': {'split': ''}}
set splitbelow

" rspec
let g:quickrun_config._ = {'runner' : 'vimproc', "runner/vimproc/updatetime" : 10}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s', 'outputter': 'buffer:filetype=rspec-result', 'filetype': 'rspec-result'}
let g:quickrun_config['ruby.bundle'] = {'command': 'ruby', 'cmdopt': 'bundle exec', 'exec': '%o %c %s'}
let g:quickrun_config['ruby.thin'] = {'command': 'rackup', 'cmdopt': 'bundle exec', 'exec': '%o %c'}
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><C-Tab> pumvisible() ? "\<Up>" : "\<C-Tab>"

let g:yankring_history_file = '.yankring_history'

let g:togglecursor_default = "block"
let g:togglecursor_insert = "line"
let g:togglecursor_leave = "line"
let g:togglecursor_disable_tmux = 0

cnoreabb <silent><expr>s getcmdtype()==':' && getcmdline()=~'^s' ? 'OverCommandLine<CR><C-u>%s/<C-r>=get([], getchar(0), '')<CR>' : 's'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

let g:neosnippet#snippets_directory = '~/dotfiles/.vim/snippets/'
