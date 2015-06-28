"==========================================
" neobundlinserte
"==========================================
" {{{
set nocompatible    " Be iMproved

if has('vim_starting')

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" }}}

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" {{{
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ColorScheme
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'

" My Bundles here:
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'thinca/vim-quickrun'
NeoBundle	'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'sorah/unite-ghq'
NeoBundle 'vim-scripts/fcitx.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'kana/vim-submode'
" indent highlight plugin:
NeoBundle 'nathanaelkane/vim-indent-guides'
" markdown plugins:
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" golang plugins:
NeoBundle 'fatih/vim-go' , {"autoload": {"filetypes": ['go']}}
NeoBundleLazy 'Blackrush/vim-gocode' , {"autoload": {"filetypes": ['go']}}
" ruby plugins:
NeoBundle 'tpope/vim-endwise'
" syntax check
NeoBundle 'scrooloose/syntastic'
" auto save
NeoBundle 'vim-scripts/vim-auto-save'
" }}}

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Display line number
set number
" Display cursor Line
set cursorline

" tab option
" {{{
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
" }}}

" set encoding
" {{{
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
" }}}

" color setting
set t_Co=256

" default fold method
set foldmethod=marker

"==========================================
" key bind
"==========================================
" <leader> key
" {{{
let mapleader = "\<Space>"
" }}}

" split
" {{{
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sw <C-w>w
nnoremap sr <C-w>r

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
" }}}

" quick run
" {{{
nnoremap <silent> qr  :<C-u>QuickRun<CR>
" }}}

" open a new file
" {{{
nnoremap <Leader>o :CtrlP<CR>
" }}}

" Copy and paste to the system clipboard
" {{{
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" }}}

"==========================================
" neocomplete
"==========================================
" {{{
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
" }}}

" {{{
" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" }}}

" Define dictionary
" {{{
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" }}}

" Define keyword
" {{{
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" }}}

" Plugin key-mappings.
" {{{
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
" }}}

" Enable omni completion
" {{{
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

" Enable heavy omni completion
" {{{
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" }}}

" For perlomni.vim setting.
" {{{
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}

"==========================================
" lightline
"==========================================
" For lightline.vim setting.
" {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
" }}}

"==========================================
" taglist
"==========================================
" set taglist
" {{{
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
" }}}

"==========================================
" emmet-vim
"==========================================
" set emmet-vim
" {{{
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
" }}}

"==========================================
" colorscheme
"==========================================
" {{{
syntax on
colorscheme molokai
highlight Normal ctermbg=none
" }}}

"==========================================
" markdown
"==========================================
" add a markdown filetype
" {{{
au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" }}}

"==========================================
" lang
"==========================================
" vim-go
" {{{
let g:go_fmt_command = "goimports"
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=2 noexpandtab ts=2
au FileType go compiler go

au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gr <Plug>(go-run)
" }}}

"==========================================
" unite.vim
"==========================================
" {{{
" let g:unite_enable_start_insert=1
nnoremap <silent> <leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <leader>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <leader>uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <leader>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <leader>uy :<C-u>Unite history/yank<CR>
" split horizon window 
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" split vertical window 
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" escape
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" Start insert mode
let g:unite_enable_start_insert=1
" Case insensitive
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" Grep Search
nnoremap <silent> <leader>gg  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" Grep search by specifying the directory
nnoremap <silent> <leader>dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" Grep search for a word at the cursor position
nnoremap <silent> <leader>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" Recall of grep search results
" nnoremap <silent> <leader>r  :<C-u>UniteResume search-buffer<CR>
" Use ag to unite grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
" }}}

"==========================================
" syntastic.vim
"==========================================
" {{{
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
    autocmd!
    autocmd InsertLeave,TextChanged *.{go,rb,js,css,pl,sh,json,html} call s:syntastic() 
augroup END
function! s:syntastic()
    w
    SyntasticCheck
endfunction
" }}}

"==========================================
" vim-auto-save
"==========================================
" {{{
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
" }}}

"==========================================
" vim-indent-guides
"==========================================
" {{{
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
" }}}
