" In GUI versions, rely on undercurl for spell errors
" Generally speaking, I don't like background highlighting on errors
highlight SpellBad guibg=NONE
highlight Error guibg=NONE
" highlight WarningMsg gui=undercurl  " I'm experiencing bugs where undercurl doesn't clear

" In my terminal setup, the default is a black background which is unreadable
" TODO: Maybe fix my .Xresources instead?
highlight Visual ctermbg=Yellow

" Ad-hoc highlighting rules 
highlight VertSplit cterm=NONE
highlight FoldColumn ctermbg=NONE
highlight SignColumn ctermbg=NONE
