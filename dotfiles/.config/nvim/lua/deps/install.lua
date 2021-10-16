local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require 'paq' {
    'savq/paq-nvim';                  -- Let Paq manage itself

    -- lsp
    'neovim/nvim-lspconfig';          -- Mind the semi-colons
    'nvim-lua/completion-nvim';
    'nvim-treesitter/nvim-treesitter';

    -- fuzzy finder
    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' };

    -- status line
    'hoob3rt/lualine.nvim';

    -- themes
    'morhetz/gruvbox';
    'overcache/NeoSolarized';
    'arcticicestudio/nord-vim'; -- colorscheme nord
    'NLKNguyen/papercolor-theme'; -- colorscheme PaperColor
    'Rigellute/rigel';
    'mhartington/oceanic-next'; -- colorscheme OceanicNext
    'tomasiser/vim-code-dark'; -- colorscheme codedark vs-code
    -- {'sonph/onehalf', opts={'rtp'= 'vim'}}

    -- icons
    'ryanoasis/vim-devicons';
    'kyazdani42/nvim-web-devicons';

    -- nerdtree
    'preservim/nerdtree';
    'tiagofumo/vim-nerdtree-syntax-highlight';

    -- git
    'tpope/vim-fugitive';
}
