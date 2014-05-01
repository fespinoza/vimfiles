" My Vim's Configuration File
" fespinozacast@gmail.com

set nocompatible            " Must come first because it changes other options.
filetype off

source ~/Vim/bundles.vim

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
set relativenumber                " Show relative line numbers
set number                        " Show line numbers.
set cursorline                    " Highlight the current line
set ruler                         " Show cursor position.
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
"set t_Co=256                      " 256 colors
set background=dark
"color grb256

set clipboard+=unnamed            " enables copy in vim and paste in OSX

" color column
highlight ColorColumn ctermbg=020202
set colorcolumn=80

command! W :w                     " Added :W as a command for save
let mapleader=","

set exrc                          " enable per-directory .vimrc files
set secure                        " disable unsafe commands in local .vimrc files

"" autocomplete
set infercase
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,i,d

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
  autocmd BufNewFile,BufRead *.hbs set ft=handlebars.html
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

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

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
vmap <C-Down> ]egv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-S-n> :NERDTreeToggle<CR>
map <Leader>cv <plug>NERDCommenterToggle
map <Leader>b :BufExplorer<CR>
map <Leader>bb :BufExplorer<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>rn :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOTABULATE WHEN TYPING TABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTAGS AND TAGBAR CONFIGURATION (Mac OSX config)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctags_path='/usr/local/bin/ctags'
let g:ctags_args='-I __declspec+ --exclude=.git'
let g:ctags_title=1
let generate_tags=1

"let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
"let g:tagbar_width=35                          " Default is 40, seems too wide
"noremap <silent> <Leader>y :TagbarToggle<CR>   " Display panel with \y (or ,y)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=syntax   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=solr/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<leader>t'

colorscheme Tomorrow-Night

"set background=light
"set background=dark
"colorscheme railscasts

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Rspec
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rspec_command = "Dispatch rspec {spec}"

" testing shortchuts
map <leader>rt :Dispatch rspec -t wip spec<CR>
map <leader>rc :call RunCurrentSpecFile()<CR>
map <leader>rk :Dispatch rspec -t now spec<CR>
map <leader>ra :Dispatch rspec spec<CR>

function! NewHashSyntax()
  /:\([^, A-Z'"]\+\) \?=> \?\([^, ]\+\)
  :%s//\1: \2/g
endfunction

map <leader>n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic + Rubocop
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:airline_powerline_fonts = 1

let g:markdown_fold_style = 'nested'

command! Path :call EchoPath()
function! EchoPath()
  echo join(split(&path, ","), "\n")
endfunction

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

let g:airline#extensions#tabline#enabled = 1

" Open Github Repo on the browser
:nmap <leader>gr :call GithubRepo()<CR>
function! GithubRepo()
  " get current line under the cursor
  let line=getline('.')
  " extract repo name from current line
  let repo_name=matchlist(line, "Bundle '\\(.*\\)'")[1]
  " open url silently
  :silent execute "!open https://github.com/".repo_name | redraw!
endfunction
