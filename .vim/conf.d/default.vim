set ruler " カーソル位置の表示
set number " 行番号の表示
set list listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲ " 不可視文字の表示
set wrap " 折り返し
set expandtab tabstop=2 shiftwidth=2 " インデントの設定
set autoindent paste
set clipboard=unnamed,autoselect
set novisualbell t_vb= " ベルを無効化
set nowritebackup nobackup noswapfile " Swapファイルの無効化
set laststatus=2

if has('win32') || has('win64')
  set shellslash " Windowsの区切り文字を変更
  set backspace=indent,eol,start " Cygwin環境で必要だった記憶
endif

" マウスカーソルを有効化
set mouse=a
if &term =~ "^screen"
  augroup MyAutoCmd
    autocmd VimLeave * :set mouse=
  augroup END

  set ttymouse=xterm2
endif

if has("gui_running")
  set imdisable
  set mousemodel=popup
  set nomousefocus
  set mousehide
endif
