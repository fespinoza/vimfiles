# Vim Files

## Requirements

* git
* bundler gem
* rake gem
* ruby 1.8.7
* xcode-console-tools (OSX)
* exuberant ctags > 5.5
* ack
* iconsolata font

### Ack Installation

#### Mac OSX

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
