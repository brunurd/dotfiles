call plug#begin('~/.vim/plugged')

  " theme
  Plug 'joshdick/onedark.vim'

  " tabs
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  " filetree
  Plug 'kyazdani42/nvim-tree.lua'

  " lsp
  Plug 'neovim/nvim-lspconfig'

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

" theme
syntax on
colorscheme onedark
hi Normal ctermbg=none

" tabs
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> <C-w> :BufferClose<CR>

lua << EOF
require'nvim-tree'.setup { }
EOF

lua << EOF
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
