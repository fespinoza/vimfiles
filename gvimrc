" My GVim's Configuration File
" fespinozacast@gmail.com

if has("gui_macvim")
  set guifont=Monaco:h12          " Mac OSX font
else
  set guifont=Inconsolata\ 11	  " Linux font
endif
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=dark               " Background.
set lines=38 columns=90           " Window dimensions.
set guioptions-=r                 " Don't show right scrollbar
colorscheme railscasts            " Set the color scheme for gvim
highlight ColorColumn guibg=black
