# Plugins to Install
# Vim Files

X  | pathogen        | plugin management                    | https://github.com/tpope/vim-pathogen
X  | tabular         | to align as table                    | https://github.com/godlygeek/tabular
X  | snipMate        | textmate-like snippets               | https://github.com/msanders/snipmate.vim
X  | vim-snippets    | a collection of snippets for vim     | https://github.com/honza/vim-snippets
X  | ctrlP           | quick code navigation                | https://github.com/kien/ctrlp.vim
X  | nerdtree        | tree code navigation                 | https://github.com/scrooloose/nerdtree
X  | nerdcommenter   | code commenter plugin                | https://github.com/scrooloose/nerdcommenter
X  | buffer explorer | to explore all open buffers          | https://github.com/vim-scripts/bufexplorer.zip
X  | superTab        | completes text using tab             | https://github.com/ervandew/supertab
X  | fugitive        | git support for vim                  | https://github.com/tpope/vim-fugitive
X  | zoomWin         | quick zoom to windows                | https://github.com/vim-scripts/ZoomWin
X  | vim-rais        |                                      | https://github.com/tpope/vim-rails
X  | endwise         | automatically closes blocks          | https://github.com/tpope/vim-endwise
X  | ctags           | to quickly navigate through the code |
## Requirements

## Others
https://github.com/tpope/vim-bundler
https://github.com/tpope/gem-ctags
https://github.com/tpope/vim-rake
https://github.com/tpope/vim-cucumber
https://github.com/tpope/vim-markdown
https://github.com/Raimondi/delimitMate
https://github.com/thoughtbot/vim-rspec
* git
* bundler gem
* rake gem
* ruby 1.8.7
* xcode-console-tools (OSX)
* exuberant ctags > 5.5
* ack
* iconsolata font

## Optional
X  | tagBar       |                                                                                                                |
   | Vroom        | to run test quickly                                                                                            |
   | Dispatch     | to run test quickly                                                                                            |
   | jasmine.vim  |                                                                                                                |
   | TagHighlight |                                                                                                                |
X  | delimitMate  | automatically closes quotes                                                                                    |
   | syntastic    | check syntax when you save                                                                                     |
   | autotag      | automatically creates tags for fast sourcecode browsing. use ctrl-[ over a symbol name to go to its definition |
   | matchit      | helps with matching brackets, improves other plugins                                                           |
   | Powerline    | awesome status bar                                                                                             | https://github.com/Lokaltog/powerline
### Ack Installation

# Inspiration
* https://github.com/skwp/dotfiles
* https://github.com/carlhuda/janus
#### Mac OSX

# Dependencies
* exuberant-ctags
* gem install gem-ctags
* gem ctags
  brew install ack

#### Ubuntu

  sudo apt-get install ack-grep

then add to your .vimrc (in ubuntu)

  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  
### Iconsolata font

TODO

## Plugins

* nerd-tree
* nerd-commenter
* command-t
* tabular
* snipmate
* tagbar
* bufexplorer
* ctags
* rails
* surround
* haml
* cucumber
* coffee-script
* unimpaired

### Ctags/Tagbar requirements

* exuberant ctags > 5.5

and for ctags plugin configure in vimrc the following lines
  
  let g:ctags_path='/path/to/ctags' 
  let g:ctags_args='-I __declspec+'

### Snipmate Installation

delete the **bundle/snipmate/snippets** directory

### Command-T Installation

#### Requisites

* vim with ruby support
* xcode-console-tools
* ruby 1.8.7

inside the command-t plugin directory
  
  cd ruby/command-t

if using rbenv

  rbenv local system

then make sure you're using ruby 1.8.7

  ruby -v

finally install command-t with:

  ruby extconf.rb
  make
