call plug#begin('~/.config/nvim/plugged')

" ------------------------------------------------------------------------------
" Colors
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-one'
Plug 'challenger-deep-theme/vim'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

" ------------------------------------------------------------------------------
" Top Plugins https://vimawesome.com/
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'dense-analysis/ale'

" ------------------------------------------------------------------------------
" Java LSP support for ALE
" Required by https://github.com/georgewfraser/java-language-server
Plug 'natebosch/vim-lsc'

" ------------------------------------------------------------------------------
" Bazel
" Add maktaba, glaive and bazel to the runtimepath.
" (maktaba and glaive must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'bazelbuild/vim-bazel'

call plug#end()

colorscheme iceberg

" Enable line numbers
set number
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing

"-------------------------------------------------------------------------------
" CtrlP
" In order to find files in a large repo
" https://github.com/kien/ctrlp.vim/issues/234
let g:ctrlp_max_files=0

"-------------------------------------------------------------------------------
" GitGitter
" Update GitGutter response time
" https://vimawesome.com/plugin/vim-gitgutter
set updatetime=100
" let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_line_number = 1

"-------------------------------------------------------------------------------
" ALE
" Let ALE jump to definitions
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_rename_tsserver_find_in_strings = 1

" Java LSP support for ALE
" https://github.com/natebosch/vim-lsc
set shortmess-=F
" Add vim-lsc configuration:
let g:lsc_server_commands = {'java': '/Users/cryan/dev/code/t/java-language-server/dist/lang_server_mac.sh'}
let g:ale_java_javalsp_executable='/Users/cryan/dev/code/t/java-language-server/dist/lang_server_mac.sh'

" ALE Fixing
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'angular': ['angular'],
\  'css': ['prettier'],
\  'html': ['prettier'],
\  'javascript': ['prettier', 'eslint'],
\  'json': ['prettier'],
\  'markdown': ['prettier'],
\  'scss': ['prettier'],
\  'typescript': ['prettier'],
\  'yaml': ['yaml']
\}
let g:ale_fix_on_save = 1
