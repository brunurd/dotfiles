call plug#begin('~/.vim/plugged')

  " theme
  Plug 'joshdick/onedark.vim'

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

  " airline bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " ctrl + p
  Plug 'kien/ctrlp.vim'

call plug#end()

" shortcuts
nnoremap <C-q> :q!<CR> " quit
nnoremap <C-s> :w<CR> " save
tnoremap <Esc> <C-\><C-n> " terminal go to normal mode

" Render whitespaces
nnoremap <leader>w <cmd>set list listchars=space:·<cr>
nnoremap <leader>ww <cmd>set list listchars=<cr>

" theme
syntax on
colorscheme onedark
hi Normal ctermbg=none

" tabs
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> <C-w> :BufferClose<CR>

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

