" 自然な移動
nnoremap j gj
xnoremap j gj
nnoremap k gk
xnoremap k gk

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
