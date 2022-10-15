--[[
  cterm terminal UI (TUI)
  - used in console version of Vim
  - set notermguicolors

  gui GUI or RGB-capable TUI (termguicolors)
  - used in GVim
  - set termguicolors (and the console is capable of TrueColor)

  - guifg={color-name}
  - guibg={color-name}
  - guisp={color-name} used for undercurl and underline.

   background
   vim.opt.background = 'light'

  ## colorschemes

  'morhetz/gruvbox';
  'overcache/NeoSolarized';
  'arcticicestudio/nord-vim'; -- colorscheme nord
  'NLKNguyen/papercolor-theme'; -- colorscheme PaperColor
  'Rigellute/rigel';

  ## https://vscodethemes.com/

  ### Dark
  One Dark Pro
  Dracula
  Atom One Dark
  Github Dark

  ### Light
  Github light
  Winter is Coming (light)
  Atom One Light
--]]

-- colorscheme
vim.cmd[[
  " colorscheme gruvbox
  " colorscheme NeoSolarized
  " colorscheme nord
  " colorscheme PaperColor
  " colorscheme rigel
  " colorscheme OceanicNext
  colorscheme codedark
]]

-- syntax
vim.cmd(':syntax on " must be :syntax on to work with :NerdTree')
vim.opt.syntax.enable = true

-- term1
vim.cmd('set t_Co=256')
vim.cmd('set t_ut=')
vim.opt.termguicolors = true


vim.cmd('let g:codedark_term256=1')

--[[
-- transparent background
vim.cmd[[
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none

  highlight Normal guibg=none
  highlight NonText guibg=nonek
]]
--]]

-- :verbose to print settings

-- :verbose hi constant
-- Constant       xxx ctermfg=75 guifg=#569CD6 blue

-- :verbose hi comment
-- Comment        xxx ctermfg=65 guifg=#6A9955 green

-- :verbose hi identifier
-- Identifier     xxx ctermfg=117 guifg=#9CDCFE light blue

-- :verbose hi statement
-- Statement      xxx ctermfg=176 guifg=#C586C0 light purple

-- :verbose hi preproc
-- PreProc        xxx ctermfg=176 guifg=#C586C0 light purple

-- :verbose hi type
-- Type           xxx ctermfg=75 guifg=#569CD6 blue

-- :verbose hi special
-- Special        xxx ctermfg=179 guifg=#D7BA7D orange

-- :verbose hi underlined
-- Underlined     xxx cterm=underline gui=underline

-- :verbose hi ignore
-- Ignore         xxx ctermfg=188 guifg=#D4D4D4 grey

-- :verbose hi error
-- Error          xxx cterm=undercurl ctermfg=203 ctermbg=234
--                    gui=undercurl guifg=#F44747 guibg=#1E1E1E guisp=#F44747 red, black, red

-- :verbose hi todo
-- Todo           xxx ctermbg=237 guibg=#373737 light black
