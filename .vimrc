"==========================================
" dein seettings
"==========================================
" vimrc directory
" {{{
let g:rc_dir = '~'
" }}}

" dein.vim directory
" {{{
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" If not dein.vim, git clone
" {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" }}}

" Management config file
" {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " toml file
  let s:toml      = g:rc_dir . '/.dein.toml'
  let s:lazy_toml = g:rc_dir . '/.dein_lazy.toml'

  " cache toml
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " colorscheme
  call dein#add('jscappini/material.vim')

  " end setting
  call dein#end()
  call dein#save_state()
endif
" }}}

" check install
" {{{
if dein#check_install()
  call dein#install()
endif
" }}}

"==========================================
" colorscheme
"==========================================
" {{{
syntax on
colorscheme material
highlight Normal ctermbg=none
" }}}

"==========================================
" set backspace
"==========================================
" {{{
set backspace=indent,eol,start
" }}}

"==========================================
" tab option
"==========================================
" {{{
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
" }}}

"==========================================
" Display line number
"==========================================
set number

"==========================================
" Display cursor Line
"==========================================
set cursorline

"==========================================
" color setting
"==========================================
set t_Co=256

"==========================================
" mouse setting
"==========================================
" disable
set mouse=

"==========================================
" set encoding
"==========================================
" {{{
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
" }}}

"==========================================
" key bind
"==========================================
" <leader> key
" {{{
let mapleader = "\<Space>"
" }}}

" inoremap
" {{{
inoremap jj <Esc>
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

" unite.vim
" {{{
nnoremap <silent> <leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <leader>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <leader>uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <leader>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <leader>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <leader>un :<C-u>UniteWithBufferDir file file/new -buffer-name=file<CR>
" }}}

" open a new file
" {{{
nnoremap <Leader>o :new<CR>
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
" markdown
"==========================================
" {{{
" add a markdown filetype
au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set fileencoding=utf-8
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
" fcitx
"==========================================
" {{{
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
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
" tagbar
"==========================================
" {{{
nnoremap <Leader>tt :TagbarToggle<CR>
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

