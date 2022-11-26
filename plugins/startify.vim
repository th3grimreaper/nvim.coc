let g:startify_bookmarks = [
  \ { 'z': '~/.zshrc' },
  \ { 'v': '~/.config/nvim/init.vim' },
  \ { 'w': '/mnt/c/Users/Praveen/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json' },
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
