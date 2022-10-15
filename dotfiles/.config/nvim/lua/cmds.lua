-- There are things we can't do with lua.
-- Right now we can't create or call ex-commands, same goes for autocommands.
--
-- Use
--
-- vim.cmd('colorscheme rubber')
--
-- Or for multiple lines
--
-- vim.cmd [[
--   syntax enable
--   colorscheme rubber
--
--   command! Hello echom "hello!!"
-- ]]


vim.cmd [[
  command! -nargs=* T split | resize 15 | terminal <args>
  command! -nargs=* VT vsplit | resize 15 | terminal <args>
]]
