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
set t_Co=256                      " 256 colors
set t_ut=
set background=dark
colorscheme railscasts

set clipboard+=unnamed            " enables copy in vim and paste in OSX

" color column
highlight ColorColumn ctermbg=000000
set colorcolumn=81

command! W :w                     " Added :W as a command for save
let mapleader=","

set exrc                          " enable per-directory .vimrc files
set secure                        " disable unsafe commands in local .vimrc files

"" autocomplete
set infercase
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,i,d

let g:markdown_fold_style = 'nested'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" set max syntax columns to prevent lag on long lines (default: 3000)
"set synmaxcol=128
" disable cursorline (default: nocursorline)
set nocursorline "
set ttyfast " u got a fast terminal
set lazyredraw " to avoid scrolling problems

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

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
  " Use octodown as default build command for Markdown files
  autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
  autocmd BufNewFile .envrc set ft=conf

  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

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

""""""""""""""""""""""""""""
"" Custom Commands
""""""""""""""""""""""""""""

command! Path :call EchoPath()
function! EchoPath()
  echo join(split(&path, ","), "\n")
endfunction

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

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

" Open Github app from Vim
command! Github :call OpenGithubApp()
function! OpenGithubApp()
  :silent execute "!github" | redraw!
endfunction

nmap <leader>l :call EditNotes()<CR>
function! EditNotes()
  :vsp ~/.vim/NOTES.md
endfunction

command! Mkdir :call MkDirs()
function! MkDirs()
  :silent execute "!mkdir -p %%" | redraw!
endfunction

" reload my .vimrc
command! So :source $MYVIMRC | :nohlsearch

" to make push from my vim directories to github
command! SyncVim :call SyncVimConfiguration()
function! SyncVimConfiguration()
  :silent execute "!(cd ~/Vim; git pull; git push)" | redraw!
  :silent execute "!(cd ~/Vim/bundle/vim-snippets; git pull; git push)" | redraw!
endfunction

command! SingleQuotes :%s/"/'/g

command! LocalVimrc :call LocalVimfile()
function! LocalVimfile()
  :silent execute "!cp ~/.vim/vimrc.local ".getcwd()."/.vimrc" | redraw!
endfunction

command! LocalProjections :call LocalProjectionsFile()
function! LocalProjectionsFile()
  :silent execute "!cp ~/.vim/projections.json ".getcwd()."/.projections.json" | redraw!
endfunction

""""""""""""""""""""""""""""
"" Plugins Configuration
""""""""""""""""""""""""""""

" ==== YouCompleteMe
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" ==== UtilSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit = "vertical"

" ==== Greplace
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

" ==== Syntastic + Rubocop
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_json_checkers=['jsonlint']

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" ==== ZoomWin
map <leader>zw :ZoomWin<CR>

" ==== Vim Rpsec
let g:rspec_command = "Dispatch rspec {spec}"

map <leader>rt :Dispatch rspec -t wip spec<CR>
map <leader>rc :call RunCurrentSpecFile()<CR>
map <leader>rk :Dispatch rspec -t now spec<CR>
map <leader>ra :Dispatch rspec spec<CR>

" ==== NERD Tree
map <leader>n :NERDTreeToggle<CR>

" ==== NERD Commenter
let NERDSpaceDelims = 1
map <Leader>cc <plug>NERDComUncommentLine
map <Leader>cv <plug>NERDComAlignedComment

" ==== Buffer Explorer
map <Leader>bb :BufExplorer<CR>

" ==== Ctrl+P
let g:ctrlp_map = '<leader>t'

" ==== Airline
let g:airline_powerline_fonts = 1

" ==== Silver Searcher
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ==== Coffescript

nmap ,rr :redraw!<CR>

" ===== JSON plugin
let g:vim_json_syntax_conceal = 0

if has('nvim')
  nmap <BS> <C-W>h
endif

set foldnestmax=8

" ====== TaskList
map <leader>v <Plug>TaskList

function! s:Marko()
  noautocmd silent execute "!open -a \"Marko\" " . expand("%:p")
  if v:shell_error
    echohl Error
    echon "Problem opening the file."
    echohl Normal
  endif
endfunction

command! -bar -nargs=0 Marko call s:Marko()
