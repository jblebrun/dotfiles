" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off
call plug#begin()
Plug 'altercation/vim-colors-solarized'
"Plug 'scrooloose/syntastic'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'for': 'go' }
"Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
"Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug '~/Projects/vim-octo'
Plug 'jasontbradshaw/pigeon.vim'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


command Bd bp\|bd \#

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

call plug#end()

set mouse=a

" always show statusline, for airline
set laststatus=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
set nocp
filetype plugin on 
filetype indent on
set background=dark
colorscheme solarized
let g:tex_flavor ="latex"
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set tenc=utf-8
set enc=utf-8
set autowrite
map <D-t> :tab sp<CR>
map <C-t> :tab sp<CR>
map <C-Left> :tabprev<CR>
map <C-Right> :tabnext<CR>
setlocal spell
setlocal spelllang=en
set iskeyword+=:
set hidden
set grepprg=grep\ -nH\ $*
set hidden
au! BufRead,BufNewFile *.scons   setfiletype python
au! BufRead,BufNewFile *.qml   setfiletype qml 
au! BufRead,BufNewFile *.nc   setfiletype nesc
au! BufRead,BufNewFile *.ctp   setfiletype php
au! BufRead,BufNewFile *.ly setf lilypond
au! BufRead,BufNewFile *.jade setf jade 
au! BufRead,BufNewFile *.coffee setf coffee 

au! BufRead,BufNewFile *.tex set textwidth=80
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set dir=~/.vimtmp
set backupdir=~/.vimbkup
set completeopt=longest,menu

set runtimepath+=/opt/local/share/lilypond/2.14.2/vim/

let g:airline_powerline_fonts = 1

set autoread

set guifont=Inconsolata\ for\ Powerline:h14

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_auto_sameids = 1

let g:go_fmt_command = "goimports"

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

let g:ctrlp_working_path_mode = 'rw' 
let g:ctrlp_root_markers = ['.ctrlp']

command! Bkill bp<bar>bd #<CR>

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction


" Project settings
au BufRead,BufEnter ~/Projects/mdt/hud*.js set et sts=2 sw=2

set exrc
set secure

nnoremap <silent> <leader><leader> :FZF<cr>

nmap <silent> gd <Plug>(coc-definition)
