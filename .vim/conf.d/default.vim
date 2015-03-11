set title " タイトルを表示
set ruler " カーソル位置の表示
set number " 行番号の表示
set list listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲ " 不可視文字の表示
set wrap " 折り返し
set expandtab tabstop=4 shiftwidth=4 " インデントの設定
set whichwrap=b,s,h,l,[,],<,>
set smartindent
set clipboard=unnamed,autoselect
set novisualbell t_vb= " ベルを無効化
set nowritebackup nobackup noswapfile " Swapファイルの無効化
set laststatus=2
set ignorecase " 大文字小文字を区別しない
set smartcase " 検索文字に大文字がある場合は区別
set wrapscan " 最後まで検索したら最初に戻る
set incsearch " インクリメンタルサーチ
set hlsearch " 検索文字をハイライト
set showmatch " 対応する括弧のハイライト
set ambiwidth=double " □や○の文字があってもカーソル位置がずれないようにする
set wildmenu " コマンドライン補完するときに強化されたものを使う
set foldmethod=indent
set foldlevel=20
set backspace=indent,eol,start
set conceallevel=0 " めっちゃうざいConcealをオフ
set viminfo=
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

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

"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END
