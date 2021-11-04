call plug#begin('~/.vim/plugged')

  " theme
  Plug 'monsonjeremy/onedark.nvim'

  " Comments
  Plug 'scrooloose/nerdcommenter'

  " tabs
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  " filetree
  Plug 'kyazdani42/nvim-tree.lua'

  " deoplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'

  " auto-formatter
  Plug 'sbdchd/neoformat'

  " python
  Plug 'zchee/deoplete-jedi'
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

call plug#end()

" shortcuts
nnoremap <C-s> :w<CR> " save
tnoremap <Esc> <C-\><C-n> " terminal go to normal mode

" Render whitespaces
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
set mouse+=a

" telescope
nnoremap <C-p> <cmd>Telescope find_files<CR>
lua << EOF
local telescope = require('telescope')

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
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

" lsp install setup
lua << EOF
require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
EOF

" open config
nnoremap <C-,> :e ~/.config/nvim/init.vim<CR> 

" deoplete
let g:deoplete#enable_at_startup = 1
