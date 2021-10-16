-- Find files using Telescope command-line sugar.

--buffers
vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  "<cmd>Telescope buffers<cr>",
  {noremap = true}
)

-- files
vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  "<cmd>Telescope find_files<cr>",
  {noremap = true}
)

-- grep
vim.api.nvim_set_keymap(
  'n',
  '<leader>fg',
  "<cmd>Telescope live_grep<cr>",
  {noremap = true}
)

-- help tags
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  "<cmd>Telescope help_tags<cr>",
  {noremap = true}
)
