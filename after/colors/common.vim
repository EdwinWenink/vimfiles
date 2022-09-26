" In GUI versions, rely on undercurl for spell errors
" Generally speaking, I don't like background highlighting on errors
highlight SpellBad guibg=NONE
highlight Error guibg=NONE
highlight WarningMsg gui=undercurl

" Fix unreadable cases in the terminal
" TODO test whether I still need this line!
highlight Visual ctermbg=Yellow

" Ad-hoc highlighting rules 
highlight VertSplit cterm=NONE
highlight FoldColumn ctermbg=NONE
highlight SignColumn ctermbg=NONE
