
" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off
"Python3 support
let g:python3_host_prog = 'python3'

" /////////////////////////////////////////////////////////
" プラグインのセットアップ
" /////////////////////////////////////////////////////////
if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ============================
" ファイル管理
" ============================
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Vimにファイラ機能を追加
NeoBundle 'Shougo/vimfiler'

" ============================
" 画面表示
" ============================
" ステータス行の表示をカスタマイズ
NeoBundle 'itchyny/lightline.vim'
" lightlineをHybridカラースキーマの配色に合わせる
NeoBundle 'cocopon/lightline-hybrid.vim'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'
" vimの非同期処理
NeoBundle 'Shougo/vimproc.vim'

" ============================
" ファイル編集
" ============================
" 入力の補完
if has('nvim')
	"neovimの際はdeoplete
	" NeoBundle 'Shougo/deoplete.nvim'
else
" neovim以外の際はneocomplete
NeoBundle 'Shougo/neocomplete.vim'
endif
" NeoBundle 'Shougo/neocomplete.vim'
" NeoBundle 'Shougo/neocomplete'
" コメントON/OFFを<C--><C-->で手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" 括弧の入力を補助
NeoBundle 'kana/vim-smartinput'
" Python補完
NeoBundle 'davidhalter/jedi-vim'
" Markdownのリアルタイムプレビューを表示
NeoBundle 'suan/vim-instant-markdown'

" ============================
" その他
" ============================
" Vim motions on speed!
NeoBundle 'Lokaltog/vim-easymotion'
" ":Restart"で再起動
NeoBundle 'tyru/restart.vim'
" ユーザ設定でサブモード
NeoBundle 'kana/vim-submode'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" /////////////////////////////////////////////////////////


" /////////////////////////////////////////////////////////
" 各種オプションの設定
" /////////////////////////////////////////////////////////
" ===========================
" Display Option
" ===========================
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
let g:hybrid_use_Xresources = 1
colorscheme hybrid
" 行番号の色
highlight LineNr ctermfg=darkyellow
" 暗い背景色に合わせた配色にする
set background=dark
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" 入力中のコマンドを表示する
set showcmd
" 検索結果をハイライト表示する
set hlsearch
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" タブ文字の表示幅
set tabstop=2
" 行番号をハイライトするためにカーソルラインを有効化
set cursorline
" カーソルラインの色のみ無効化
hi clear CursorLine
" 現在の列を強調表示
set cursorcolumn

" ============================
" File Option
" ============================
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" undoファイルを作成しない
set noundofile
" バックアップファイルの作成場所を設定
set backupdir=~/.vim/tmp
" Markdown https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" if you want to enable fenced code block syntax highlighting in your markdown documents you can enable it
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
" ============================
" Edit Option
" ============================
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" タブ入力を複数の空白入力に置き換える
"set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 自動改行なし
set textwidth=0
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 無名レジスタに入るデータを、*レジスタにも入れる。(yankした文字列をクリップボードから利用できる)
set clipboard+=unnamed
" <C-L>で画面を再描画する際にハイライトをリセット
nnoremap <silent> <C-L> :noh<C-L><CR>
" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
" inoremap <C-h> <Left>
inoremap <C-h> <BS>
" inoremap <C-l> <Right>
inoremap <C-l> <CR>
" /////////////////////////////////////////////////////////


" /////////////////////////////////////////////////////////
" 各種Plugin設定
" /////////////////////////////////////////////////////////

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
" =========================================================
" Unite.vimの設定
" =========================================================
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" =========================================================

"  http://dackdive.hateblo.jp/entry/2014/08/13/130000
" =========================================================
" deoplete.vim, neocomplete.vim
" =========================================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
if has('nvim')
	" let s:hooks = neobundle#get_hooks("deoplete.nvim")
	" function! s:hooks.on_source(bundle)
		" " Use deoplete.
		" let g:deoplete#enable_at_startup = 1
		" " Use smartcase.
		" let g:deoplete#enable_smart_case = 1
		" " Set minimum syntax pattern length.
		" let g:deoplete#auto_complete_start_length = 3
		" inoremap <expr><C-g> deoplete#mappings#undo_completion()
    "
		" " <TAB>: manaual complete
		" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" :
		" 	\ deoplete#mappings#manual_complete()
    "
		" " <CR>: close popup and save indent.
		" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		" function! s:my_cr_function() abort
		" 	return deoplete#mappings#close_popup() . "\<CR>"
		" endfunction
    "
		" " <C-h>, <BS>: close popup and delete backword char.
		" " inoremap <expr><C-h> deoplete#mappings#smart_close_popup() . "\<C-h>"
		" inoremap <expr><BS> deoplete#mappings#smart_close_popup() . "\<C-h>"

	" endfunction
else
	" let s:hooks = neobundle#get_hooks("neocomplete.vim")
	" function! s:hooks.on_source(bundle)
		" Disable AutoComplPop.
		let g:acp_enableAtStartup = 0
		" Use neocomplete.
		let g:neocomplete#enable_at_startup = 1
		" Use smartcase.
		let g:neocomplete#enable_smart_case = 1
		" Set minimum syntax keyword length.
		let g:neocomplete#sources#syntax#min_keyword_length = 3
		let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
		" Plugin key-mappings.
		inoremap <expr><C-g>     neocomplete#undo_completion()

		" Recommended key-mappings.
		" <CR>: close popup and save indent.
		inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		function! s:my_cr_function()
			" return neocomplete#close_popup() . "\<CR>"
			" For no inserting <CR> key.
			return pumvisible() ? neocomplete#close_popup() : "\<CR>"
		endfunction
		" <TAB>: completion.
		inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
		" <C-h>, <BS>: close popup and delete backword char.
		" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
		inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
		inoremap <expr><C-y>  neocomplete#close_popup()
		inoremap <expr><C-e>  neocomplete#cancel_popup()

		" Close popup by <Space>.
		" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
	" endfunction
endif
" =========================================================


" http://dackdive.hateblo.jp/entry/2014/08/13/130000
" =========================================================
" jedi-vim
" =========================================================
" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

" jedi-vimとneocomplete.vimの連携
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" =========================================================


" http://http://haya14busa.com/mastering-vim-easymotion/
" =========================================================
" Boost your productivity with EasyMotion
" =========================================================
" Disable default mappings
" If you are true vimmer, you should explicitly map keys by yourself.
" Do not rely on default bidings.
let g:EasyMotion_do_mapping = 0

" Or map prefix key at least(Default: <Leader><Leader>)
" map <Leader> <Plug>(easymotion-prefix)
"
" =======================================
" Find Motions
" =======================================
" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" `s{char}{char}{target}`
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
" Of course, you can map to any key you want such as `<Space>`
" map <Space>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" =======================================
" Line Motions
" =======================================
" `JK` Motions: Extend line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0

" =======================================
" General Configuration
" =======================================
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" Use migemo in serch
let g:EasyMotion_use_migemo = 1

" =======================================
" Search Motions
" =======================================
" Extend search motions with vital-over command line interface
" Incremental highlight of all the matches
" Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
" :h easymotion-command-line
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
" =========================================================


" =========================================================
" restart.vim
" =========================================================
" 終了時に保存するセッションオプションを設定する
let g:restart_sessionoptions = 'blank,buffers,folds,help,localoptions,tabpages'
" =========================================================


" =========================================================
" submode.vim
" =========================================================
" ウィンドウサイズの連続変更
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
" =========================================================
" /////////////////////////////////////////////////////////


" /////////////////////////////////////////////////////////
" 機能追加コード
" /////////////////////////////////////////////////////////

" http://inari.hatenablog.com/entry/2014/05/05/231307
" ============================
" 全角スペースの表示
" ============================
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif
" ============================


" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
" ============================
" 挿入モード時、ステータスラインの色を変更
" ============================
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction
" ============================


" ============================
" 最後のカーソル位置を復元する
" ============================
if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal! g'\"" |
				\ endif
endif
" ============================


" http://moznion.hatenadiary.com/entry/2014/06/08/223931
" ============================
" 保存時にフックして常に末尾の空白を削除する
" ============================
let g:does_remove_trailing_white_space = 1

autocmd BufWritePre * call s:removeTrailingWhiteSpace()

func! s:removeTrailingWhiteSpace()
  if &ft != 'markdown' && g:does_remove_trailing_white_space == 1
    :%s/\s\+$//ge
  endif
endfunc

" `:ToggleRemoveTrailingWhiteSpace` というコマンドを実行すると
" 保存時にフックして空白を削除するか否かをトグル
command! -nargs=0 ToggleRemoveTrailingWhiteSpace
  \ call s:toggleRemovingTrailingWhiteSpaceStatus()

func! s:toggleRemovingTrailingWhiteSpaceStatus()
  let g:does_remove_trailing_white_space =
    \ !g:does_remove_trailing_white_space
endfunc
" ============================
" /////////////////////////////////////////////////////////

filetype indent on
