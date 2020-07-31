NeoVim
================================================================================

Needs
--------------------------------------------------------------------------------

File Tree Navigation
- File tree explorer
- Find ~ fuzzy find by file name
- Grep search

Code Navigation:
- Go to definition
- Find uses

Fuzzy Find Options:
- https://github.com/ctrlpvim/ctrlp.vim
  - Watch: 54
  - Star: 4.1k
  - Fork: 611
  - Contributors: 68
  - Last Commit: Nov 7 2019

  - Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
  - Full support for Vim's regexp as search patterns.
  - Built-in project's root finder.
  - Open multiple files at once.
  - Create new files and directories.

- fzf https://github.com/junegunn/fzf.vim
  - Watch: 72
  - Star: 4.3k
  - Fork: 307
  - Contributors: 54
  - Last Commit: 2 days ago
  
  - Based on https://github.com/junegunn/fzf
  - Not vim specific. You can use in regular shell and vim
  - Install with Homebrew
  ```bash
  brew install fzf
  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install
  ```

  - Now you can install via vim-plug:
  If you already installed fzf using Homebrew, the following should suffice:
  ```vim
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  ```

- Denite https://github.com/Shougo/denite.nvim
  - Watch: 49
  - Start: 1.6k
  - Fork: 207
  - Contributors: 85
  - Last Commit: Yesterday

  - It is like a fuzzy finder, but is more generic. You can extend the interface and create the sources.
  - Written in Python3
  
  - Opening files
  - Switching buffers
  - Inserting the value of a register
  - Changing current directory
  - Searching for a string
  
  - vim-plug:
  ```vim
  if has('nvim')
    Plu Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/denite.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  ```

Language Syntax: 
- Auto import
- Auto complete
- Auto format

- C/C++
- Python
- Go
- Rust
- TypeScript/JavaScript
- Java


Auto Complete Options:
- YouCompleteMe https://github.com/ycm-core/YouCompleteMe
  - Watch: 598 
  - Start: 20.5k
  - Fork: 2.3k
  - Contributors: 136
  - Last Commit: 8 days ago

  - An identifier-based engine that works with every programming language,
  - Clang-based engine that provides native semantic code completion for C/C++/Objective-C/Objective-C++/CUDA (from now on referred to as "the C-family languages"),
  - Powerful clangd-based completion engine for the C-family languages.
  - Jedi-based completion engine for Python 2 and 3,
  - OmniSharp-Roslyn-based completion engine for C#,
  - Gopls-based completion engine for Go,
  - TSServer-based completion engine for JavaScript and TypeScript,
  - rls-based completion engine for Rust,
  - jdt.ls-based experimental completion engine for Java.
  - generic Language Server Protocol implementation for any language
and an omnifunc-based completer that uses data from Vim's omnicomplete system to provide semantic completions for many other languages (Ruby, PHP etc.).jjjjjj

- Deoplete https://github.com/Shougo/deoplete.nvim
  - Deoplete is the abbreviation of "dark powered neo-completion".
  - It provides an extensible and asynchronous completion framework for neovim/Vim8.

  ```vim
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  let g:deoplete#enable_at_startup = 1
  ```

  You need a language client and LanguageServers
  - LanguageClient https://github.com/autozimu/LanguageClient-neovim seems like the most straight forward.
  - Alternatively you can all start everything individually, but who has time for that.

- COC https://github.com/neoclide/coc.nvim
  - Watch: 96 
  - Start: 8.2k
  - Fork: 294
  - Contributors: 94

  ```vim
  " Use release branch (Recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  ```


Git:
- Branch
- Status
- Rebase results
- Diff to see changes
- Merge conflict resolution


Commands I can't seem to remember
--------------------------------------------------------------------------------

### Marks
`:marks` to list all marks
`ma` to make a mark in register "a"
\`a to go to mark "a"

Combine with actions
d\`a to delete from cursor to "a"
c\`a to change text from cursor to "a"
y\`a to yank from cursor to "a"

]\`	jump to next lowercase mark
[\`	jump to previous lowercase mark

If you wipeout a buffer (command :bw), all marks for the buffer are deleted.

The :delmarks command (abbreviated as :delm) may be used to delete specified marks.

Command	Description
:delmarks a	delete mark a
:delmarks a-d	delete marks a, b, c, d
:delmarks abxy	delete marks a, b, x, y
:delmarks aA	delete marks a, A
:delmarks!	delete all lowercase marks for the current buffer (a-z)

### Registers
Every register is accessed using a double quote before its name. For example, we can access the content that is in the register r with "r.

`:reg` to list registers
`"ry` to yank text to register "r"
`"rp` to print register "r"

Use `Ctrl-r` + register name in input/command mode to paste contents of register
`Ctrl-r r`

Unnamed Register
The default register used by vim for d, c, s, x, or y is ""

Numbered Registers
vim automatically populates what is called the numbered registers for us. As expected, these are registers from "0 to "9.
"0 will always have the content of the latest yank, and the others will have last 9 deleted text, being "1 the newest, and "9 the oldest. So if you yanked some text, you can always refer to it using "0p.
`"0` last yank
`"1` last d,c,s,x or y 1 ago etc..."9

Read only registers
There are 4 read only registers: "., "%, ": and "#
`".` last inserted text
`"%` has the current file path, starting from the directory where vim was first opened.
`":` is the most recently executed command. Run `@:` to re run command `:s/foo/bar` for example
`:#` is the name of the alternate file, that you can think of it as the last edited file

### Search and Replace

Visual Selection
After selecting, escape then
`:%s/\%Vold/NEW/g`

Search replace across files
Requires multiple steps:

1. Capture all the files to search
`:args somePath/**/*.ts`

List all files captured with `:args`

2. Use argdo to run commands across files
Run command on all files
`:argdo %s/old/new/gc | update`

