-- background
-- vim.opt.background = 'light'

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
vim.cmd(':syntax on " must be :syntax on to work with NerdTree')
vim.opt.syntax.enable = true

-- term1
vim.cmd('set t_Co=256')
vim.cmd('set t_ut=')
vim.opt.termguicolors = true


vim.cmd('let g:codedark_term256=1')
