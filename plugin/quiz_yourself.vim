" TODO list
"   - create a function for searching ALL notes for questions
"   - support other grep tools, e.g. ripgrep
"
" Do not reload if already loaded
if exists("g:loaded_quiz_yourself")
    finish
endif
let g:loaded_quiz_yourself = 1

" Defaults
if !exists('g:quiz_marker')
    let g:quiz_marker = '*Q*'
endif

function s:PasteQuickfix()
   for q in getqflist()
       put=q.text
   endfor
endfunction

" NOTE multiple questions in a single line not supported
if !exists(":SearchQuestions")
    command SearchQuestions :execute 'vimgrep ' escape(g:quiz_marker, '\') . ' %'
endif

if !exists(":PasteQuestions")
    command PasteQuestions call s:PasteQuickfix()
endif

" Should these mappings call the *commands* or the functions?
" Think maybe function is the proper way because we can then use <SID>?
" On the other hand.. I do an existence check on the commands so...
"nnoremap <silent> <Plug>(SearchQuestions) :call <SID>SearchQuestions<CR>
nnoremap <silent> <Plug>(SearchQuestions) :SearchQuestions<CR>
nnoremap <silent> <Plug>(PasteQuestions) :call <SID>PasteQuickfix()<CR> 

if !hasmapto('<Plug>(PasteQuestions)', 'n')
    nmap <unique> <leader>pq <Plug>(PasteQuestions)
endif

if !hasmapto('<Plug>(SearchQuestions)', 'n')
    nmap <unique> <leader>sq <Plug>(SearchQuestions)
endif
