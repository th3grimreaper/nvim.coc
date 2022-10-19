set expandtab
set shiftwidth=2
set softtabstop=2
set number
set relativenumber
set termguicolors

call plug#begin("~/.vim/plugged")
  " Plugin Section
    Plug 'navarasu/onedark.nvim'
    Plug 'scrooloose/nerdtree'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-emmet', 'coc-snippets', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
  "Config Section
  let g:onedark_config = {
      \ 'style': 'darker',
  \}
  colorscheme onedark 

  "nerdtree
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeIgnore = []
  let g:NERDTreeStatusline = ''
  " Automaticaly close nvim if NERDTree is only thing left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Toggle
  nnoremap <silent> <C-b> :NERDTreeToggle<CR>

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
  nnoremap <c-n> :call OpenTerminal()<CR>

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

  "nerdtree-git
  let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
  let g:NERDTreeGitStatusShowClean = 1

  let NERDTreeShowHidden=0

  "lua links
  lua require('nodeignore')
  lua require('indent')
  lua require'colorizer'.setup()
  "statusline
  source ~/.config/nvim/statusline.vim

