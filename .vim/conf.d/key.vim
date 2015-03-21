" 自然な移動
nnoremap j gj
xnoremap j gj
nnoremap k gk
xnoremap k gk

" jjでインサートモードを抜ける
inoremap <silent> jj <ESC>

" 検索のハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 検索単語を中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 選択した範囲のインデントサイズを連続変更
vnoremap < <gv
vnoremap > >gv

" あれ
imap <C-a> <Home>
imap <C-e> <End>

" set pasteをかってにやる
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" choose-win
nmap - <Plug>(choosewin)
