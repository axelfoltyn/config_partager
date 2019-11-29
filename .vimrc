set encoding=utf-8 fileencodings=


" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
syntax on                       "turn on syntax highlighting

filetype plugin indent on

set mouse=a                     "activate mouse

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab                   "change tab to space

"Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>


" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif



" ================ show couple of parent =======================
set  showmatch



" ================ search =======================
set  incsearch
set  ignorecase
set  smartcase
set hlsearch                            " Highlight search results



" ================ show line of cursor  =======================
set  cursorline





" Better command-line completion
set wildmenu

" ================ alias  =======================
iab  #i #include
iab io #include <stdio.h>
iab std #include <stdlib.h>



" ================ test  =======================
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
