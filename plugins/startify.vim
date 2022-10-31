let g:startify_bookmarks = [
  \ { 'z': '~/.zshrc' },
  \ { 'v': '~/.config/nvim/init.vim' },
  \ ]

let g:startify_lists = [
      \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
      \ { 'header': ['   MRU'],            'type': 'files' },
      \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
      \ ]

let g:startify_custom_header = [
      \'  _______   ____ _____  ______   ___________ ',
      \'\_  __ \_/ __ \\__  \ \____ \_/ __ \_  __ \  ',
      \' |  | \/\  ___/ / __ \|  |_> >  ___/|  | \/  ',
      \' |__|    \___  >____  /   __/ \___  >__|     ',
      \'             \/     \/|__|        \/         ',
      \]

nmap <c-n> :Startify<cr>
