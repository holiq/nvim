function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
    let s .= '%#MyTabLineAccent# '
    
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel# ' . (i + 1) . ' '
    else
      let s .= '%#TabLine# ' . (i + 1) . ' '
    endif

    let s .= '%#MyTabLineSeparator# '
    
    hi MyTabLineAccent  guifg=#1A1E2D guibg=#1f2335
    hi MyTabLineSeparator guifg=#1A1E2D guibg=#1f2335
  endfor

  let s .= '%#TabLineFill#%T'
  
  return s
endfunction

hi TabLine     guifg=#565f89 guibg=#1A1E2D gui=None
hi TabLineFill guifg=#1f2335 guibg=#1f2335 gui=Bold
hi TabLineSel  guifg=#41a6b5 guibg=#1A1E2D gui=None

set tabline=%!MyTabLine()
