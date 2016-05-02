set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set confirm

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on
let g:alduin_Shout_Aura_Whisper = 1
let g:alduin_Shout_Fire_Breathe = 1
colorscheme alduin
"let g:seoul256_background = 235
"colo seoul256

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" Formatting and font
set number
set cursorline
:filetype plugin indent on
set expandtab ts=2 sw=2 sts=2
set autoindent
set nocindent
set nosmartindent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
let g:indentkguides_start_level = 1
let g:indent_guides_guide_size = 1

" plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
call plug#end()

" Compiler settings
" Python compiling
autocmd FileType python :nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Java compiling
map <F9> :set makeprg=javac\ %<CR>:make<CR>
map <F10> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
map <F11> :set makeprg=javac\ #<CR>:make<CR>
map <F12> :!echo #\|awk -F. '{print $1}'\|xargs java<CR>
map! <F9> <Esc>:set makeprg=javac\ %<CR>:make<CR>
map! <F10> <Esc>:!echo %\|awk -F. '{print $1}'\|xargs java<CR>
map! <F11> <Esc>set makeprg=javac\ #<CR>:make<CR>
map! <F12> <Esc>!echo #\|awk -F. '{print $1}'\|xargs java<CR>
set makeprg=javac\ %
set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
if argc() == 2
  n
  e #
endif


" key mappings
:map <F2> :mksession! ~/vim_session <cr> " Quick write session
:map <F3> :source ~/vim_session <cr> " Auto load last session
let mapleader = "\<Space>"
:imap <silent> <A-a> <C-o>b
:imap <silent> <A-s> <C-o>j
:imap <silent> <A-d> <C-o>e
:imap <silent> <A-w> <C-o>k
:imap ii <Esc>
:vnoremap <C-c> "*y
:vnoremap <C-v> "*v
:nnoremap <silent> <A-l> :tabn<CR>
:nmap <silent> <A-j> :wincmd w<CR>
:nmap <silent> <A-k> :wincmd W<CR>
