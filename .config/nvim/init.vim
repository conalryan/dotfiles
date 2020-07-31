" ----------------------------------------------------------------------------- 
" BASE Setup:
" source $HOME/.config/nvim/cr_base.vim
" No plugins found here, should all be basic vim/nvim capabilities

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Highlight max line length
set colorcolumn=80

" LINE WRAP
set nowrap

" LINE NUMBERS
set number

" MOUSE support
set mouse=a

" SPLITS
" set splitbelow
set splitright

" TABS
set expandtab 
set shiftwidth=2
set smarttab
set softtabstop=0
set tabstop=2

" TABLINE
" always show tab bar
set showtabline=2

" set nowrap           " do not automatically wrap on load
" set formatoptions-=t " do not automatically wrap text when typing
" set autoindent
" set smartindent

"------------------------------------------------------------------------------- 
" FINDING FILES:

set incsearch

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - Add fild path to search only in that dir e.g. :find ./some-dir/*.ts <tab>

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
" - You can type a substring of any file name after :b and it will find a
"   match
" - You can also use tab to open menu e.g. :b <tab> list all buffers and tab
"   through them, or :b <sub-string> <tab> to autocomplete matches

"------------------------------------------------------------------------------- 
" TAG JUMPING:
" Need to install ctags first

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags
"
" CR:
" - In an angular template if you try to jump tag under curse (^]) of that
"   component it will jump you to angular.json

"------------------------------------------------------------------------------- 
" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" - ^p to go to previous 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list
"
" CR:
" - Yes it completes, but it gives you everything in JavaScript and in
"   TypeScript. Does it require stricter languages?

"------------------------------------------------------------------------------- 
" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
"   :edit . to open a file browser. You can navigate open in split with 'v',
"   open in tab with 't'
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" CR:
" - Pretty cool, seams like you could easily replace NERDTree but requires
"   time and effort

"------------------------------------------------------------------------------- 
" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

"------------------------------------------------------------------------------- 
" BUILD INTEGRATION:
" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix
" 
" NOTE: Plugins are better, but you should be aware that this exists. Perhaps,
" it will improve in the future
"
" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

"-------------------------------------------------------------------------------
" Registers:
" - Default register is what everything goes to when you use for example 'dd'
" - Use '+' register
" - Use double quote command \" to specify a specific register e.g. \"a
"   Then use \"aP to paste from 'a' or \"bP to past from 'b' etc.
" - Special clipboards are '+' and '*'
" - Copy to system clipboard "+ then in other progam Command P to paste from
"   VIM

" ----------------------------------------------------------------------------- 
" LIST ALL PLUGINS HERE:
" source $HOME/.config/nvim/cr_plugins.vim
" Workaround for https://github.com/junegunn/vim-plug/issues/454
" Configuration will be corresponding file

call plug#begin('~/.config/nvim/plugged')

" ------------------------------------------------------------------------------
" cr_color_scheme.vim
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'challenger-deep-theme/vim'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'jdsimcoe/abstract.vim'
Plug 'NLKNguyen/papercolor-theme'
" Doesn't have great NERDTree support
Plug 'danilo-augusto/vim-afterglow'
Plug 'gregsexton/Atom'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'

" ------------------------------------------------------------------------------
" cr_edit.vim
" Code commenting/uncommenting
Plug 'tpope/vim-commentary'

" Fuzzy Find
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Surround
Plug 'tpope/vim-surround'

" ------------------------------------------------------------------------------
" cr_git
Plug 'tpope/vim-fugitive'

" ------------------------------------------------------------------------------
" cr_lang
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neoclide/coc-angular', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-xml', {'do': 'yarn install --frozen-lockfile'}

" Plug 'Valloric/YouCompleteMe'

" Bazel
" Add maktaba, glaive and bazel to the runtimepath.
" (maktaba and glaive must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'bazelbuild/vim-bazel'

" Rust
Plug 'rust-lang/rust.vim'

" ------------------------------------------------------------------------------
" cr_view
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'majutsushi/tagbar'

call plug#end()

" ----------------------------------------------------------------------------- 
" Color Themes: https://github.com/rafi/awesome-vim-colorschemes
" source $HOME/.config/nvim/cr_color_schemes.vim

" OCEAN:
" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
" Theme
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" END OCEAN

" ----------------------------------------------------------------------------- 
" EDIT MENU:
" source $HOME/.config/nvim/cr_edit.vim
" Copy, Paste, Delete, Find, Search & Replace etc

" Fuzzy Find
" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'up': '~40%' }

" TODO open window top center (0, 50%)
" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '10new' }

" ----------------------------------------------------------------------------- 
" LANGUAGE INTEGRATION:
" source $HOME/.config/nvim/cr_lang.vim
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-python


" ----------------------------------------------------------------------------- 
" VIEW MENU:
" source $HOME/.config/nvim/cr_view.vim
" Sidebars, gutters, etc

" https://vimawesome.com/plugin/vim-gitgutter
set updatetime=100
" let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_line_number = 1

" Auto open NERDTree on vim startup
autocmd vimenter * NERDTree

" NERDTree Key mappings
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>

" Auto close NERDTree if it's the last open window
" FAILS
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
