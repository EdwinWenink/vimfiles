" Ways of listing Python functions in current file
" :ilist def *
" :vim /def\ ./ %
" followed by :copen
" :g/def\ .*
" :CtrlPBufTag

" Handy default Vim navigation mappings that work with Python
"    [[ Jump backwards to begin of current/previous toplevel
"    [] Jump backwards to end of previous toplevel
"    ][ Jump forwards to end of current toplevel
"    ]] Jump forwards to begin of next toplevel
"    [m Jump backwards to begin of current/previous method/scope
"    [M Jump backwards to end of previous method/scope
"    ]M Jump forwards to end of current/next method/scope
"    ]m Jump forwards to begin of next method/scope

" If for some reason we cannot find the Python executable on Windows
" enable Python support on Windows by showing where the .dll is
if has('win32') and !has('python3') 
    " Check which .dll is expected with :version
    let $PYTHONHOME = '~\AppData\Local\Programs\Python\Python310\'
    let &pythonthreedll= '~\AppData\Local\Programs\Python\Python310\python310.dll'
endif
let g:pymode_python = 'python3'

" Workaround to avoid notifications about imp module being deprecated
if has('python3')
    silent! python3 1
endif

setlocal expandtab shiftwidth=4 tabstop=4 
" Next line made it impossible to use > on lines starting with '#'
" because in C this is an include statement and not a comment
" setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,cla
setlocal nosmartindent
setlocal nocindent
setlocal completeopt-=preview
setlocal number
setlocal foldmethod=indent foldlevel=99

augroup python
    au!
    autocmd BufWritePost *.py call Flake8()  " Run linter on saving
    autocmd BufRead,BufNewFile *.py let python_highlight_all = 1
    autocmd BufRead,BufNewFile *.py let python_space_error_highlight = 1
augroup END

" Flake8 linting
nmap <buffer> <localleader>fl :call flake8#Flake8()<CR>
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" Customize markers
let g:flake8_error_marker='x>'
let g:flake8_warning_marker='~>'

" Do not show quickfix (bit too intrusive for my taste)
let g:flake8_show_quickfix=0

" Unset markers ('flake unset' aka 'fuck u')
nnoremap <localleader>fu :call flake8#Flake8UnplaceMarkers()<CR>

" Show error message of current line in the rules
" 'flake current'
nnoremap <localleader>fc :call flake8#Flake8ShowError()<CR>

" Jedi-vim (deoplete + python)
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
let g:jedi#goto_command = "<localleader>g"
let g:jedi#goto_assignments_command = "<localleader>a"
let g:jedi#goto_stubs_command = "<localleader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<localleader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<localleader>r"

" Within regular vimrc, I used autocommands for detecting the filetype
" That's not necessary in this ftplugin anymore
"augroup python
    " Trying to indent comments but doens't seem to work yet; see tip in :help smartindent
    " smartindent causes this problem because in C # is a preprocessor statement
    " In fact, seems to make >> stop working on comments altogether
	"autocmd!
	"autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,cla
    "autocmd FileType python setlocal completeopt-=preview
    "autocmd FileType python setlocal number
    "autocmd FileType python :let python_space_error_highlight = 1
    "autocmd FileType python map <buffer> <localleader>\fl :call flake8#Flake8()<CR>
	"autocmd FileType python setlocal foldmethod=indent foldlevel=99
    "autocmd BufWritePost *.py call Flake8()  " Run linter on saving
"augroup END
"

