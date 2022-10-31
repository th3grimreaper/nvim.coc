  let g:StslineColorGreen  = "#2BBB4F"
  let g:StslineColorBlue   = "#4799EB"
  let g:StslineColorViolet = "#986FEC"
  let g:StslineColorYellow = "#D7A542"
  let g:StslineColorOrange = "#EB754D"
   
  let g:StslineColorLight  = "#C0C0C0"
  let g:StslineColorDark   = "#080808"
  let g:StslineColorDark1  = "#181818"
  let g:StslineColorDark2  = "#202020"
  let g:StslineColorDark3  = "#303030"
   
   
  " Define colors
  let g:StslineBackColor   = g:StslineColorDark2
  let g:StslineOnBackColor = g:StslineColorLight
  "let g:StslinePriColor   = g:StslineColorGreen
  let g:StslineOnPriColor  = g:StslineColorDark
  let g:StslineSecColor    = g:StslineColorDark3
  let g:StslineOnSecColor  = g:StslineColorLight
   
   
  " Create highlight groups
  execute 'highlight StslineSecColorFG guifg=' . g:StslineSecColor   ' guibg=' . g:StslineBackColor
  execute 'highlight StslineSecColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineSecColor
  execute 'highlight StslineBackColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineBackColor
  execute 'highlight StslineBackColorFGSecColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslineSecColor
  execute 'highlight StslineSecColorFGBackColorBG guifg=' . g:StslineSecColor ' guibg=' . g:StslineBackColor
  execute 'highlight StslineModColorFG guifg=' . g:StslineColorYellow ' guibg=' . g:StslineBackColor
   
   
   
  " Statusline
  
  " Enable statusline
  set laststatus=2
  
  " Disable showmode - i.e. Don't show mode like --INSERT-- in current statusline.
  set noshowmode
  
  " Define active statusline
  
  function! ActivateStatusline()
  setlocal statusline=%#StslinePriColorBG#\ %{StslineMode()}%#StslineSecColorBG#%{get(b:,'coc_git_status',b:GitBranch)}%{get(b:,'coc_git_blame','')}%#StslineBackColorFGPriColorBG#%#StslinePriColorFG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslinePriColorFG#\ %{&filetype}\ %#StslineSecColorFG#%#StslineSecColorBG#%{&fenc!='utf-8'?\"\ \":''}%{&fenc!='utf-8'?&fenc:''}%{&fenc!='utf-8'?\"\ \":''}%#StslinePriColorFGSecColorBG#%#StslinePriColorBG#\ %p\%%\ %#StslinePriColorBGBold#%l%#StslinePriColorBG#/%L\ :%c\ 
  endfunction
  
  
  
  " Define Inactive statusline
  
  function! DeactivateStatusline()
  
  if !exists("b:GitBranch") || b:GitBranch == ''
  setlocal statusline=%#StslineSecColorBG#\ INACTIVE\ %#StslineSecColorBG#%{get(b:,'coc_git_statusline',b:GitBranch)}%{get(b:,'coc_git_blame','')}%#StslineBackColorFGSecColorBG#%#StslineBackColorBG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslineBackColorBG#\ %{&filetype}\ %#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ 
  
  else
  setlocal statusline=%#StslineSecColorBG#%{get(b:,'coc_git_statusline',b:GitBranch)}%{get(b:,'coc_git_blame','')}%#StslineBackColorFGSecColorBG#%#StslineBackColorBG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslineBackColorBG#\ %{&filetype}\ %#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ 
  endif
  
  endfunction
  
  
  
  " Get Statusline mode & also set primary color for that mode
  function! StslineMode()
  
      let l:CurrentMode=mode()
  
      if l:CurrentMode==#"n"
          let g:StslinePriColor     = g:StslineColorBlue
          let b:CurrentMode = "NORMAL "
  
      elseif l:CurrentMode==#"i"
          let g:StslinePriColor     = g:StslineColorViolet
          let b:CurrentMode = "INSERT "
  
      elseif l:CurrentMode==#"c"
          let g:StslinePriColor     = g:StslineColorYellow
  
          let b:CurrentMode = "COMMAND "
  
      elseif l:CurrentMode==#"v"
          let g:StslinePriColor     = g:StslineColorGreen
          let b:CurrentMode = "VISUAL "
  
      elseif l:CurrentMode==#"V"
          let g:StslinePriColor     = g:StslineColorGreen
          let b:CurrentMode = "V-LINE "
  
      elseif l:CurrentMode==#"\<C-v>"
          let g:StslinePriColor     = g:StslineColorGreen
          let b:CurrentMode = "V-BLOCK "
  
      elseif l:CurrentMode==#"R"
          let g:StslinePriColor     = g:StslineColorViolet
          let b:CurrentMode = "REPLACE "
  
      elseif l:CurrentMode==#"s"
          let g:StslinePriColor     = g:StslineColorGreen
          let b:CurrentMode = "SELECT "
  
      elseif l:CurrentMode==#"t"
          let g:StslinePriColor     =g:StslineColorYellow
          let b:CurrentMode = "TERM "
  
      elseif l:CurrentMode==#"!"
          let g:StslinePriColor     = g:StslineColorYellow
          let b:CurrentMode = "SHELL "
  
      endif
  
  
      call UpdateStslineColors()
      
      return b:CurrentMode
  
  endfunction
  
  
  
  " Update colors. Recreate highlight groups with new Primary color value.
  function! UpdateStslineColors()
  
  execute 'highlight StslinePriColorBG           guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor
  execute 'highlight StslinePriColorBGBold       guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor ' gui=bold'
  execute 'highlight StslinePriColorFG           guifg=' . g:StslinePriColor   ' guibg=' . g:StslineBackColor
  execute 'highlight StslinePriColorFGSecColorBG guifg=' . g:StslinePriColor   ' guibg=' . g:StslineSecColor
  execute 'highlight StslineSecColorFGPriColorBG guifg=' . g:StslineSecColor   ' guibg=' . g:StslinePriColor
  
  if !exists("b:GitBranch") || b:GitBranch == ''
  execute 'highlight StslineBackColorFGPriColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslinePriColor
  endif
  
  endfunction
  
  
  
  " Get git branch name
  
  function! GetGitBranch()
  let b:GitBranch=""
  try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
          let b:GitBranch="  ".substitute(l:gitrevparse, '\n', '', 'g')." "
          execute 'highlight StslineBackColorFGPriColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslineSecColor
      endif
  catch
  endtry
  endfunction
  
  " Get git branch name after entering a buffer
  augroup GetGitBranch
      autocmd!
      autocmd BufEnter * call GetGitBranch()
  augroup END
  
  
  " Set active / inactive statusline after entering, leaving buffer
  augroup SetStslineline
      autocmd!
      autocmd BufEnter,WinEnter * call ActivateStatusline()
      autocmd BufLeave,WinLeave * call DeactivateStatusline()
  augroup END
