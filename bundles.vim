""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Managed by Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required!
Bundle 'gmarik/vundle'

" SnipMate (+ dependencies)
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'fespinoza/vim-snippets'

" Automatic Autocomplete compatible with SnipMate
Bundle 'vim-scripts/L9'
Bundle 'othree/vim-autocomplpop'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'christoomey/vim-colors-ctoomey'

" lean & mean status/tabline for vim that's light as air
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'

" Seamless navigation between tmux panes and vim splits
Bundle 'christoomey/vim-tmux-navigator'

" Fuzzy file, buffer, mru, tag, etc finder.
Bundle 'kien/ctrlp.vim'

" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'

" unimpaired.vim: pairs of handy bracket mappings
Bundle 'tpope/vim-unimpaired'

" endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script,
" etc
Bundle 'tpope/vim-endwise'

" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)
Bundle 'tpope/vim-ragtag'

"" Rails Development

" This is a lightweight bag of Vim goodies for Bundler, best accompanied by
" rake.vim and/or rails.vim
Bundle 'tpope/vim-bundler'

" Rake.vim is a plugin leveraging projectile.vim to enable you to use all
" those parts of rails.vim that you wish you could use on your other Ruby
" projects, including :A, :Elib and friends, and of course :Rake. It's great
" when paired with gem open and bundle open and complemented nicely by
" bundler.vim
Bundle 'tpope/vim-rake'

" This simple plugin provides a :Rbenv command that wraps !rbenv with tab
" complete. It also tells recent versions of vim-ruby where your Ruby installs
" are located, so that it can set 'path' and 'tags' in your Ruby buffers to
" reflect the nearest .ruby-version file.
Bundle 'tpope/vim-rbenv'

"" CTAGS
" Automatic ctags generation on gem install
Bundle 'tpope/gem-ctags'
" Updates entries in a tags file automatically when saving
Bundle 'vim-scripts/AutoTag'

" For markdown
Bundle 'tpope/vim-markdown'
Bundle 'nelstrom/vim-markdown-folding'

Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'edsono/vim-matchit'
Bundle 'godlygeek/tabular'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'skwp/vim-git-grep-rails-partial'
Bundle 'stefanoverna/vim-i18n'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'ngmy/vim-rubocop'

" VIM as a presentation tool
Bundle 'tybenz/vimdeck'

" Parse stack traces or quickfix entries and open the result in vim splits!
Bundle 'mattboehm/vim-unstack'

" Javascript support for vim
Bundle "pangloss/vim-javascript"

filetype plugin indent on     " required!

"" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.