" Auto install vimplug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

"Declare plugins
call plug#begin('~/.config/nvim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" themes
Plug 'arcticicestudio/nord-vim'
Plug 'overcache/NeoSolarized'

" Collection of common configs for language servers for each language
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

autocmd!
" set autowrite
set background=dark "or light
" set cmdheight=3
" set colorcolumn=80
colorscheme NeoSolarized " nord
set conceallevel=0
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set hidden
set ignorecase
" set mouse=a
set nowrap
set nowrapscan
set number
set path+=**
set shell=fish
set shiftwidth=2
set showcmd
set showmatch
set showmode
set showtabline=2
set smartcase
set softtabstop=0
set splitbelow
set splitright
set syntax=ON
set tabstop=2
set termguicolors

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {  }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {  },  -- list of language that will be disabled e.g. { "c", "rust" }
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
