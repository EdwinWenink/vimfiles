" In GUI versions, rely on undercurl for spell errors
" In terminal, use underline instead and remove background
" Generally speaking, I don't like background highlighting on errors
highlight SpellBad cterm=underline ctermbg=NONE ctermfg=red guibg=NONE
highlight SpellCap cterm=underline ctermbg=NONE guibg=NONE
highlight SpellRare cterm=underline ctermbg=NONE guibg=NONE
highlight Error cterm=underline ctermbg=NONE guibg=NONE
" highlight WarningMsg gui=undercurl  " I'm experiencing bugs where undercurl doesn't clear

" Ad-hoc highlighting rules
highlight VertSplit cterm=NONE
highlight FoldColumn ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" I want pop up menu's to use the overall background color
highlight PMenu guibg=NONE

" No background on Folding
highlight Folded ctermbg=None guibg=None
