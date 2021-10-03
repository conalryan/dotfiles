" base
" ------------------------------

autocmd!

" Explorer: NERDTree like
"
" handy commands:
" :! ls -lF
" :find path/to/file.txt
" :vs path/to/file.txt
" :sp path/to/file.txt
" :tabnew path/to/file.txt
" ctags -R . " once file is create then CTRL-] to navigate tags
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_keepdir = 0
let g:netrw_liststyle = 3
" Change the copy command. Mostly to enable recursive copy of directories.
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_winsize = -28 " 25

" Highlight marked files in the same way search matches are.
hi! link netrwMarkFile Search

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'python', 'html', 'css', 'java', 'rust', 'go']

:syntax on " must be :syntax on to work with NerdTree set syntax=on doesn't work

" set autowrite not sure I want this?
" set background="light" dark is the default
" set cmdheight=3
" set colorcolumn=80
" set clipboard=unnamedplus " now everything is yanked to system clipboard
set conceallevel=0
set expandtab
" set fileencoding=UTF-8 needed?
" set fileencodings=UTF-8 needed?
set fileformats=unix,dos,mac
set ignorecase
" set mouse=a
set nowrap
set nowrapscan
set number
set path+=**
set shell=zsh
set shiftwidth=2
set showmatch
set showmode
set showtabline=2
set smartcase
set softtabstop=0
" set nospell spelllang=en_us
set spell spelllang=en_us
set splitright
set tabstop=2
set termguicolors
set t_Co=256
set title