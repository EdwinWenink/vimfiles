" Interactive programming
" 1. Start up Vim 8 terminal, load correct environments, load iPython
" 2. Send keys to open session
"       - either current line with <localleader>i)
"       - or visual selection with <localleader>v)
let g:shellname = 'cmd.exe'  " TODO This setting should not be hardcoded in the future

" NOTE right now I just use the shell variable because for cmd.exe it is the same.
" Does this hold in general and cross platform? Probably not.
" nnoremap <localleader>i :y \| :call term_sendkeys(bufnr(&shell), @")<CR>
nnoremap <localleader>i :y \| :call term_sendkeys(bufnr(shellname), @")<CR>

" NOTE pasting with autoindent causes indentation issues with pasting
" See: https://ipython.org/ipython-doc/dev/interactive/reference.html#autoindent
" Quick fix: toggle within iPython with %autoindent 
vnoremap <localleader>v :y \| :call term_sendkeys(bufnr(&shell), @")<CR>
