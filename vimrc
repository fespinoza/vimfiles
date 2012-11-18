" My Vim's Configuration File
" fespinozacast@gmail.com

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set number                        " Show line numbers.
set cursorline                    " Highlight the current line
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set novisualbell                  " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set laststatus=2                  " Show the status line all the time

"" searching
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

"" tab
set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab
set autoindent

"" color
set t_Co=256                      " 256 colors
set background=dark
color grb256

" color column
highlight ColorColumn ctermbg=020202
set colorcolumn=80

command! W :w                     " Added :W as a command for save
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLDING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldcolumn=2                 " Display folds visually
"set foldopen=all                 " Open automatically fold
set foldmethod=syntax             " indent | manual are other options

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

  " Omni Completion
  autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  " May require ruby compiled in
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd BufNewFile,BufRead *_spec.rb compiler rspec

  " My autocommants
  autocmd BufNewFile,BufRead *.js.erb set ft=javascript.eruby
  autocmd BufNewFile,BufRead *.html.erb set ft=html.eruby
  autocmd BufNewFile,BufRead *.html.haml set ft=haml
  autocmd BufNewFile,BufRead *.ctp set ft=php.html
  autocmd BufNewFile,BufRead *.md set ft=markdown
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,scss,coffee,eruby,yaml,cucumber set ai sw=2 sts=2 et
  autocmd FileType css,html,javascript,sass,python set ai sw=2 sts=2 et
  autocmd FileType php set ai sw=2 sts=2 noet
  autocmd FileType ruby,haml,scss,coffee,eruby,yaml,cucumber normal zR
  autocmd FileType css,html,javascript,sass,php,python normal zR

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cut-Copy-Paste
nmap <C-B> "+gP
imap <C-B> <ESC><C-B>i
vmap <C-Y> "+y
map <C-S> :w<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>

" Indentation Commands
nmap <Leader>hh <<
nmap <Leader>ll >>
vmap <Leader>hh <gv
vmap <Leader>ll >gv

" Bubbling Text
" single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" multiple lines
vmap <C-Up> [egv
vmap<C-Down> ]egv
