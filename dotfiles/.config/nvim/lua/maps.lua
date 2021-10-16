vim.g.mapleader = ' '

-- Esc
vim.api.nvim_set_keymap(
  'i',
  'jk',
  "<Esc>",
  {noremap = true}
)

vim.api.nvim_set_keymap(
  't',
  'jk',
  "<C-\\><C-n>",
  {noremap = true}
)

-- resize (winheight)
vim.api.nvim_set_keymap(
  'n',
  '<Leader>+',
  ":exe 'resize ' . (winheight(0) * 3/2)<CR>",
  {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>-',
  ":exe 'resize ' . (winheight(0) * 2/3)<CR>",
  {noremap = true, silent = true}
)

-- vertical resize (winwidth)
vim.api.nvim_set_keymap(
  'n',
  '<Leader>+',
  ":exe 'vertical resize ' . (winheight(0) * 3/2)<CR>",
  {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>-',
  ":exe 'vertical resize ' . (winheight(0) * 2/3)<CR>",
  {noremap = true, silent = true}
)

-- :Vexplore
vim.api.nvim_set_keymap(
  'n',
  '<Leader>dd',
  ':Vexplore %:p:h<CR>',
  {noremap = true}
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>da',
  ':Vexplore<CR>',
  {noremap = true}
)

-- Window
vim.api.nvim_set_keymap(
  'n',
  '<Leader>w',
  '<C-w>',
  {noremap = true}
)


