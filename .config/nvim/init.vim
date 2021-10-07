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

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'

  " languages
  Plug 'sheerun/vim-polyglot'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'ionide/Ionide-vim'

  " bottom bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " ctrl + p
  Plug 'kien/ctrlp.vim'

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" shortcuts
"nnoremap <C-q> :q!<CR> " quit
nnoremap <C-s> :w<CR> " save
tnoremap <Esc> <C-\><C-n> " terminal go to normal mode

" Render whitespaces
nnoremap <leader>w <cmd>set list listchars=space:·<cr>
nnoremap <leader>ww <cmd>set list listchars=<cr>

" theme
syntax on
lua << EOF
require('onedark').setup()
EOF
hi Normal ctermbg=none
let g:clear_background=0
execute 'colorscheme ' . g:colors_name

" tabs
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> <C-c> :BufferClose<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

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

