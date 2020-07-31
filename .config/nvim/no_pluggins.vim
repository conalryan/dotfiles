
"------------------------------------------------------------------------------- 
" ColorScheme for cr sanity
" Fish shell and default nvim colorscheme suck!
call plug#begin('~/.config/nvim/plugged')

" Fuzzy Find
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Colors
Plug 'morhetz/gruvbox'

call plug#end()
colorscheme gruvbox
"------------------------------------------------------------------------------- 

" FEATURES TO COVER:
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File Browsing
" - Snippets
" - Build Integration (if we have time)

" GOALS OF THIS TALK:
" - Increase Vim understanding
" - Offer powerful options

" NOT GOALS OF THIS TALK:
" - Hate on plugins
" - Get people to stop using plugins

"------------------------------------------------------------------------------- 
" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" CR
set number

" TABS:
set expandtab 
set shiftwidth=2
set smarttab
set softtabstop=0
set tabstop=2  

" END CR

"------------------------------------------------------------------------------- 
" FINDING FILES:

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
" Registers
" - Default register is what everything goes to when you use for example 'dd'
" - Use '+' register
" - Use double quote command \" to specify a specific register e.g. \"a
"   Then use \"aP to paste from 'a' or \"bP to past from 'b' etc.
" - Special clipboards are '+' and '*'
" - Copy to system clipboard "+ then in other progam Command P to paste from
"   VIM

"------------------------------------------------------------------------------- 
" Plugins I use
" Vundle
" Some syntax specific plugins
" NERDTree
" All of Tim Pope's
" - surround
"
