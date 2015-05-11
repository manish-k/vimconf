" Solarized
syntax on
set background=dark
let g:solarized_termcolors=256
" Add this to .bashrc
" export TERM=xterm-256color
colorscheme solarized
"set t_Co=256
" debian specific
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm

" Some basic stuff
set textwidth=79   " line longer than 79 coloumns will be broken
set shiftwidth=4   " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4      " a hard TAB displays as 4 columns
set expandtab      " insert spaces when hitting TABs
set softtabstop=4  " insert/delete 4 spaces when hitting TAB/BACKSPACE
set shiftround     " round indent to multiple of 'shitwidth'
set autoindent     " align the new line indent with the previous line
set incsearch      " first match for pattern while typing 
set hlsearch       " highlight pattern
set cpoptions+=$   " end character for change command
set autoread       " set to auto read when a file is changed from the outside
set nu             " show line numbers
set ruler          " show current position
set smarttab       " Be smart

" The leader key
let mapleader = ',' 

" Searching
" set ignorecase smartcase incsearch hlsearch 

" don't display welcome
set shortmess+=I 

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8 

" Turn backup off
set nobackup
set nowb
set noswapfile 

" remove whitespace http://vim.wikia.com/wiki/Remove_unwanted_spaces
" " called by leader-m
:nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> 

" maximize current window
nmap <leader>o <c-w>o 


" Load THE PATHOGEN!!!
filetype off
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" Python Mode
let g:pymode = 0
let g:pymode_doc = 0

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Maping Windows movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Dante Must Die!!!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Commnet/Uncomment like a pro
function! Comment()
    let ext = tolower(expand('%:e'))
    if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
        silent s/^/\#/
    elseif ext == 'js' || ext == 'scala'
        silent s:^:\/\/:g
    elseif ext == 'vim'
        silent s:^:\":g
    endif
endfunction
 
function! Uncomment()
    let ext = tolower(expand('%:e'))
    if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
        silent s/^\#//
    elseif ext == 'js' || ext == 'scala'
        silent s:^\/\/::g
    elseif ext == 'vim'
        silent s:^\"::g
    endif
endfunction
 
map <C-a> :call Comment()<CR>
map <C-b> :call Uncomment()<CR> 
