--[[
  Scopes: 

  general (vim.o)
  Gets or sets general settings.
  vim.o.background = 'light'

  window (vim.wo)
  Gets or sets window-scoped options.
  vim.wo.colorcolumn = '80'

  buffer (vim.bo)
  Gets or sets buffer-scoped options.
  vim.bo.filetype = 'lua'

  global (vim.g)
  Gets or sets global variables. This is usually the namespace where you'll find variables set by plugins. The only one I know isn't tied to a plugin is the leader key.
  use space as the leader key
  vim.g.mapleader = ' '
  
  vim.opt
  With vim.opt we can set global, window and buffer settings.
  When we use it like this vim.opt acts like the :set command in vimscript, it give us a consistent way to modify neovim's options.
  To check the state of an option use print(vim.inspect(vim.opt.autoindent))

    vim.opt.autoindent = true -- buffer-scoped
    vim.opt.autowrite = true -- global scope
    vim.opt.cursorline = true -- window-scoped
--]]

vim.g.markdown_fenced_languages = {'bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'python', 'html', 'css', 'java', 'rust', 'go'}

--[[
  Explorer: NERDTree lik
  handy commands:
  :! ls -lF
  :find path/to/file.txt
  :vs path/to/file.txt
  :sp path/to/file.txt
  :tabnew path/to/file.txt
  ctags -R . " once file is create then CTRL-] to navigate tags
--]]
vim.g.netrw_altv = 1
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3
-- Change the copy command. Mostly to enable recursive copy of directories.
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_winsize = -28 -- 25
vim.cmd [[
  autocmd!
  " Highlight marked files in the same way search matches are.
  hi! link netrwMarkFile Search
  " uncomment if not using NERDtree
  " augroup ProjectDrawer
  "   autocmd!
  "   autocmd VimEnter * :Vexplore
  " augroup END
  let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'python', 'html', 'css', 'java', 'rust', 'go']
]]
vim.opt.conceallevel = 0
vim.opt.expandtab = true
vim.opt.fileformats = {'unix', 'dos', 'mac'}
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.path:append('**')
vim.opt.shell = 'zsh'
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.softtabstop = 0
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.title = true
vim.opt.wrap = false
vim.opt.wrapscan = false
