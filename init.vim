set expandtab
set shiftwidth=2
set softtabstop=2
set number
set relativenumber
set termguicolors

call plug#begin("~/.vim/plugged")
  " Plugin Section
    Plug 'navarasu/onedark.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tpope/vim-vinegar'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-emmet', 'coc-snippets', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'mhinz/vim-startify'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
  "Config Section
  let g:onedark_config = {
      \ 'style': 'darker',
  \}
  colorscheme onedark 

  "toggle-terminal
  " open new split panes to right and below
  set splitright
  set splitbelow
  " turn terminal to normal mode with escape
  tnoremap <Esc> <C-\><C-n>
  " start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " open terminal on ctrl+n
  function! OpenTerminal()
    split term://zsh
    resize 10
  endfunction
  nnoremap <c-b> :call OpenTerminal()<CR>

  " use alt+hjkl to move between split/vsplit panels
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l

  "telescope
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  "vim-vinegar
  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

  "tab-completion
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ CheckBackSpace() ? "\<TAB>" :
        \ coc#refresh()
  
  function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  
  let g:coc_snippet_next = '<tab>'

  "makes indent blankline ignore certain filetypes
  let g:indent_blankline_filetype_exclude = ['startify', 'help']

  "lua links
  lua require('nodeignore')
  lua require('indent')
  lua require'colorizer'.setup()
  lua require('treesitter')

  "statusline
  source ~/.config/nvim/plugins/statusline.vim
  source ~/.config/nvim/plugins/startify.vim

