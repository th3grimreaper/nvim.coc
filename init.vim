call plug#begin("~/.vim/plugged")
  " Plugin Section
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'navarasu/onedark.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tpope/vim-vinegar'
    Plug 'numToStr/Comment.nvim'
    Plug 'tpope/vim-surround'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-autopairs'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-emmet', 'coc-snippets', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'goolord/alpha-nvim'
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

  "toggle alpha start screen
  nmap <c-n> :Alpha<cr>

  "lua links
  lua require('nodeignore')
  lua require('indent')
  lua require'colorizer'.setup()
  lua require("nvim-autopairs").setup {}
  lua require('treesitter')
  lua require('autopair')
  lua require('status')
  lua require'alpha'.setup(require'alpha.themes.dashboard'.config)
  lua require('alpha-nvim')
  lua require('config')
  lua require('keymaps')
  lua require('Comment').setup()
