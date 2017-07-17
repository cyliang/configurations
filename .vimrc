set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "%",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "-",
    \ "Dirty"     : "x",
    \ "Clean"     : "✓",
    \ "Unknown"   : "?"
    \ }

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#middle_click_preserves_windows = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1

Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-fugitive'

Plugin 'rdnetto/YCM-Generator'
Plugin 'valloric/youcompleteme'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<C-e>'
let g:ycm_show_diagnostics_ui = 1

Plugin 'rhysd/vim-clang-format'
let g:clang_format#code_style = 'llvm'
let g:clang_format#style_options = {
            \ "AccessModifierOffset": -4,
            \ "AlignConsecutiveAssignments": "true",
            \ "AllowShortLoopsOnASingleLine": "true",
            \ "ColumnLimit": 0,
            \ "IndentWidth": 4,
            \ "MaxEmptyLinesToKeep": 2}

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'cyliang/vim-vendetta'
set background=dark

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0

Plugin 'majutsushi/tagbar'

Plugin 'cyliang/llvm.vim'

Plugin 'cyliang/swift.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append  to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append  to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append  to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" An example for a vimrc file.

" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nobackup		" do not keep a backup file, use versions instead

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200     " keep 200 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set wildmenu        " display completion matches in a status line
syntax on

set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

colorscheme vendetta
set number
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" Line width hint (80)
if exists('+colorcolumn')
  set colorcolumn=80
endif


nnoremap >       :vertical resize +1<CR>
nnoremap <       :vertical resize -1<CR>
nnoremap +       :resize +1<CR>
nnoremap -       :resize -1<CR>
nnoremap <tab>   :bnext<CR>
nnoremap <S-tab> :bprevious<CR>
nnoremap <C-]>   :YcmCompleter GoToDeclaration<CR>
nnoremap <C-\>   :YcmCompleter GoToDefinition<CR>
nnoremap <C-f>   :YcmCompleter FixIt<CR>
nnoremap <C-c>   :TagbarToggle<CR>
nnoremap <C-n>   :NERDTreeToggle<CR>

vnoremap <C-f>   :ClangFormat<CR>
vnoremap <C-d>   :StripWhitespace<CR>

