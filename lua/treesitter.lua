require'nvim-treesitter.configs'.setup {
  ensure_installed = 'html', 'javascript', 'css', 'typescript', 'tsx',
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    disable = {'help', 'cpp'},
  }
}
