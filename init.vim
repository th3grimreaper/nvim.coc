call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tpope/vim-vinegar'
    Plug 'sainnhe/gruvbox-material'
    Plug 'lewis6991/impatient.nvim'
    Plug 'numToStr/Comment.nvim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-surround'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-autopairs'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-eslint', 'coc-emmet', 'coc-snippets', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'goolord/alpha-nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
  "Config Section
    if has('termguicolors')
      set termguicolors
    endif
    set background=dark
    let g:gruvbox_material_background = 'soft'
    let g:gruvbox_material_better_performance = 1
    colorscheme gruvbox-material

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
  nnoremap <c-t> :call OpenTerminal()<CR>

  "telescope
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  "prettier
  command! -nargs=0 Prettier :CocCommand prettier.formatFile


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
  lua require('coc')
  lua require('impatient')
  lua require('imp')
  lua require('undotree')
