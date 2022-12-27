" Interactive programming
" 1. Start up Vim 8 terminal, load correct environments, load iPython
" 2. Send keys to open session
"       - either current line with <localleader>i)
"       - or visual selection with <localleader>v)

" Note that bufnr('$') opens the last buffer; this may be handy.
" But this buffer does not necessarily exist. You can check existence with
" bufexists(bufnr('$'))
" Also see buflisted

" Also, bufnr() works with file patterns, e.g. bufnr('exe')
" So terminal buffers called cmd.exe (1) are also found.
" However, a catch is that it returns -1 if there are multiple hits so
" this plugin does not work correctly with multiple terminals open

" NOTE right now I just use the shell variable because for cmd.exe it is the same.
" Does this hold in general and cross platform? Probably not.
nnoremap <localleader>i :y \| :call term_sendkeys(bufnr(&shell), @")<CR>

" NOTE pasting with autoindent causes indentation issues with pasting
" See: https://ipython.org/ipython-doc/dev/interactive/reference.html#autoindent
" Quick fix: toggle within iPython with %autoindent 
" We remove empty lines to avoid them terminating a function definition
vnoremap <localleader>v :y \| :call term_sendkeys(bufnr(&shell), substitute(@", '\n\+', '\n', 'g'))<CR>

" TODO maybe have a command open a terminal with the right name
" TODO maybe have a shortcut to send all the right setup to iPython,
" such as %autoindent
nnoremap <localleader>sp :call term_sendkeys(bufnr(&shell), "ipython --no-autoindent")<CR>
