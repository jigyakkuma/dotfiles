"==========================================
" neobundlinserte
"==========================================
set nocompatible    " Be iMproved

if has('vim_starting')

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ColorScheme
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'

" My Bundles here:
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'thinca/vim-quickrun'
NeoBundle	'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'sorah/unite-ghq'
NeoBundle 'vim-scripts/fcitx.vim'
" markdown plugins:
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" golang plugins:
NeoBundle 'fatih/vim-go'
NeoBundleLazy 'Blackrush/vim-gocode' , {"autoload": {"filetypes": ['go']}}
" ruby plugins:
NeoBundle 'tpope/vim-endwise'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


set number
set cursorline

" tab option
set expandtab "$B%?%VF~NO$rJ#?t$N6uGrF~NO$KCV$-49$($k(B
set tabstop=2 "$B2hLL>e$G%?%VJ8;z$,@j$a$kI}(B
set shiftwidth=2 "$B<+F0%$%s%G%s%H$G$:$l$kI}(B
set softtabstop=2 "$BO"B3$7$?6uGr$KBP$7$F%?%V%-!<$d%P%C%/%9%Z!<%9%-!<$G%+!<%=%k$,F0$/I}(B
set autoindent "$B2~9T;~$KA0$N9T$N%$%s%G%s%H$r7QB3$9$k(B
set smartindent "$B2~9T;~$KF~NO$5$l$?9T$NKvHx$K9g$o$;$F<!$N9T$N%$%s%G%s%H$rA}8:$9$k(B

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
" Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" export TERM=xterm-256color
" 
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" For lightline.vim setting.
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2

" color setting
set t_Co=256

" set encoding
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" set taglist
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

" set emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END

" set syntastic.vim
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {'mode': 'passive'} 
augroup AutoSyntastic
    autocmd!
    autocmd InsertLeave,TextChanged * call s:syntastic() 
augroup END
function! s:syntastic()
    w
    SyntasticCheck
endfunction

"==========================================
"" colorscheme
"==========================================
syntax on
colorscheme koehler
set background=dark

"==========================================
" markdown
"==========================================

" add a markdown filetype
au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown


"==========================================
" lang
"==========================================
""" golang
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
