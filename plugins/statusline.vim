function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineFilename guifg=#bdae93 guibg=#1A1E2D    
    hi MyStatuslineAccentBody guifg=#bdae93  guibg=#1A1E2D     
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineFilename guifg=#83a598 guibg=#1A1E2D    
    hi MyStatuslineAccentBody guifg=#83a598  guibg=#1A1E2D    
  " Replace mode
  elseif a:mode == 'R' 
    hi MyStatuslineFilename guifg=#fb4934 guibg=#1A1E2D    
    hi MyStatuslineAccentBody guifg=#fb4934  guibg=#1A1E2D    
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V' 
    hi MyStatuslineFilename guifg=#d65d0e guibg=#1A1E2D    
    hi MyStatuslineAccentBody guifg=#d65d0e  guibg=#1A1E2D    
  " Command mode
  elseif a:mode == 'c' 
    hi MyStatuslineFilename guifg=#d79921 guibg=#1A1E2D    
    hi MyStatuslineAccentBody guifg=#d79921  guibg=#1A1E2D    
  " Terminal mode
  elseif a:mode == 't' 
    hi MyStatuslineFilename guifg=#98971a guibg=#1A1E2D    
    hi MyStatuslineAccentBody guifg=#98971a  guibg=#1A1E2D    
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction
" }}}

function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi MyStatuslineModifiedBody guifg=#d79921 guibg=#1A1E2D
    else
        hi MyStatuslineModifiedBody guifg=#928374 guibg=#1A1E2D
    endif
    return '●'
endfunction
" }}}

function! SetFiletype(filetype) " {{{
  if a:filetype == ''
      return '-'
  else
      return a:filetype
  endif
endfunction
" }}}

function! GitHunk() " {{{
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
autocmd User GitGutter call GitHunk()
" }}}

function! GitBranch(git) " {{{
  if a:git == ""
    return '-'
  else
    return a:git
  endif
endfunction
" }}}

" function! WordCount() " {{{
"   let s:old_status = v:statusmsg
"   let position = getpos(".")
"   exe ":silent normal g\<c-g>"
"   let stat = v:statusmsg
"   let s:word_count = 0
"   if stat != '--No lines in buffer--'
"     let s:word_count = str2nr(split(v:statusmsg)[11])
"     let v:statusmsg = s:old_status
"   end
"   call setpos('.', position)
"   return s:word_count 
" endfunction
" autocmd User * call WordCount()
" }}}

" function! CurrentChar() " {{{
"   return strlen(substitute(join(add(getline(1,line('.')-1),strpart(getline('.'),0,col('.')-1)),'.'),'.','.','g'))
" endfunction
" autocmd User * call CurrentChar()
" }}}

" function! TotalChar() " {{{
"   return strlen(substitute(join(getline(1,'$'),'.'),'.','.','g'))
" endfunction
" autocmd User * call TotalChar()
" }}}


" Statusline ------------------------------
set statusline+=%{RedrawModeColors(mode())}

" Left side items
" =======================
set statusline+=%#MyStatuslineBackground#\ 
set statusline+=%#MyStatuslineAccentBody#●\ 

" Filename
set statusline+=%#MyStatuslineFilename#%t
set statusline+=%#MyStatuslineBackground#\ 

" Git Branch
set statusline+=%#MyStatuslineBackground#
set statusline+=%#MyStatuslineGreenBody#%{GitBranch(FugitiveHead())}
set statusline+=%#MyStatuslineBackground#\ 

" Right side items
" =======================
set statusline+=%=

" Line and Column
set statusline+=%#MyStatuslineBackground#
set statusline+=%#MyStatuslineBlueBody#%2l
set statusline+=\/%#MyStatuslineBlueBody#%2c
set statusline+=%#MyStatuslineBackground#\ 
 
" Current scroll percentage and total lines of the file
" set statusline+=%#MyStatuslineBackground#
" set statusline+=%#MyStatuslineBlueBody#%P
" set statusline+=\/\%#MyStatuslineBlueBody#%L
" set statusline+=%#MyStatuslineBackground#\ 

" Filetype
set statusline+=%#MyStatuslineBackground#
set statusline+=%#MyStatuslineGreenBody#%{SetFiletype(&filetype)}
set statusline+=%#MyStatuslineBackground#\

" Total Word, Current Character(cursor position), and Total Character 
" set statusline+=%#MyStatuslineBackground#
" set statusline+=%#MyStatuslineGreenBody#%{WordCount()}
" set statusline+=\,\%#MyStatuslineGreenBody#%{CurrentChar()}
" set statusline+=\/\%#MyStatuslineGreenBody#%{TotalChar()}
" set statusline+=%#MyStatuslineBackground#\  

" Git
set statusline+=%#MyStatuslineBackground#
set statusline+=%#MyStatuslineGreenBody#%{GitHunk()}
set statusline+=%#MyStatuslineBackground#\ 

hi MyStatuslineBackground  guifg=#1A1E2D  guibg=none
hi MyStatuslineGreenBody   guifg=#689d6a  guibg=#1A1E2D  ctermfg=5  cterm=none  ctermbg=0
hi MyStatuslineBlueBody    guifg=#458588  guibg=#1A1E2D  ctermfg=2  cterm=none  ctermbg=0
