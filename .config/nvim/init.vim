call plug#begin('~/.vim/plugged')

  " theme
  Plug 'monsonjeremy/onedark.nvim'

  " comments
  Plug 'scrooloose/nerdcommenter'

  " tabs
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  " filetree
  Plug 'kyazdani42/nvim-tree.lua'

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

  " auto-formatter
  Plug 'sbdchd/neoformat'

  " python
  Plug 'sansyrox/vim-python-virtualenv'
  Plug 'davidhalter/jedi-vim'

  " languages
  Plug 'unifiedjs/unified-language-server'
  Plug 'sheerun/vim-polyglot'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'ionide/Ionide-vim'
  Plug 'hashivim/vim-terraform'
  Plug 'chrisbra/csv.vim'
  Plug 'styled-components/vim-styled-components'
  Plug 'maxmellon/vim-jsx-pretty'

  " bottom bar
  Plug 'hoob3rt/lualine.nvim'

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " editorconfig
  Plug 'editorconfig/editorconfig-vim'

  " wakatime
  Plug 'wakatime/vim-wakatime'

  " tree sitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'APZelos/blamer.nvim'

  " git diff
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sindrets/diffview.nvim'

  " workspaces
  Plug 'natecraddock/workspaces.nvim'

  " searching
  " obs.: needs silversearcher-ag
  " sudo apt install -y silversearcher-ag
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " typescript
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'

  " styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " html
  Plug 'mattn/emmet-vim'

call plug#end()

" shortcuts
nnoremap <C-s> :w<CR> " save
tnoremap <Esc> <C-\><C-n> " terminal go to normal mode

" Hybrid line numbers
"set number relativenumber
"set nu rnu

" Render whitespaces
set list listchars=space:·
nnoremap <leader>w <cmd>set list listchars=space:·<cr>
nnoremap <leader>ww <cmd>set list listchars=<cr>

" theme
syntax on
lua << EOF
require('onedark').setup({ transparent = true })
EOF

" bottor bar
lua << EOF
require('lualine').setup {options = {theme = 'onedark'}}
EOF

" tabs
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> <C-c> :BufferClose<CR>

" mouse
"set mouse+=a
nnoremap <leader>m <cmd>set mouse-=a<cr>
nnoremap <leader>mm <cmd>set mouse+=a<cr>

" workspaces
lua << EOF
require("workspaces").setup({
    hooks = {
        open = { "NvimTreeOpen", "Telescope find_files" },
    }
})
EOF

" telescope
nnoremap <C-p> <cmd>Telescope find_files<CR>
lua << EOF
local telescope = require('telescope')

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  },
  extensions = {
    workspaces = {
      keep_insert = true,
    }
  }
}
EOF

" tree.lua setup
lua << EOF
require'nvim-tree'.setup { }

local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree
EOF

" tabs
nnoremap <silent> <C-b> :NvimTreeToggle<CR>
" inverse tab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" lsp install setup
lua << EOF
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)
EOF

" open config
nnoremap <C-,> :e ~/.config/nvim/init.vim<CR> 

" git gutter
command! GitGutterEnable
nnoremap <leader>g <cmd>:GitGutterDisable<cr>
nnoremap <leader>gg <cmd>:GitGutterEnable<cr>

" git blame
let g:blamer_enabled = 1
