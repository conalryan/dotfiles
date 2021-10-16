-- Start NERDTree when Vim is started without file arguments.
vim.cmd[[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

  let g:NERDTreeNodeDelimiter = "\u00a0" " fix ^G in OSX
  let g:NERDTreeGitStatusUseNerdFonts = 1

  let g:webdevicons_enable = 1
  " adding the flags to NERDTree
  let g:webdevicons_enable_nerdtree = 1

  " set guifont=DroidSansMono\ Nerd\ Font:h11
]]

-- find
vim.api.nvim_set_keymap(
  'n',
  '<leader>nf', -- <C-f>',
  ":NERDTreeFind<CR>",
  {noremap = true}
)

-- focus
vim.api.nvim_set_keymap(
  'n',
  '<leader>no',
  ":NERDTreeFocus<CR>",
  {noremap = true}
)

-- open
vim.api.nvim_set_keymap(
  'n',
  '<leader>n', -- <C-n>',
  ":NERDTree<CR>",
  {noremap = true}
)

-- toggle
vim.api.nvim_set_keymap(
  'n',
  '<leader>nt', -- <C-t>',
  ":NERDTreeToggle<CR>",
  {noremap = true}
)
