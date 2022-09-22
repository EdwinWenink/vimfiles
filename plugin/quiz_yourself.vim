" SEE help write-plugin
" ---------------- Quiz yourself ---------------- "
"
" Leave questions to yourself in your notes with *Q* or **Q** markers
" and then collect them in the quickfix list using this plugin.
"
" Use default quickfix list navigation like `:cnext` and `:cprev` to navigate questions.
" You can also paste them from the quickfix window into a file to print them out.


" Do not reload if already loaded
" if exists("g:loaded_quiz_yourself")
    " finish
" endif
" g:loaded_quiz_yourself = 1

" TODO when pasting we can get errors about trailing characters
" Do I need to escape something?
:function PasteQuickfix()
:   for q in getqflist()
:       put=q.text
:   endfor
:endfunction


" Paste from quickfix list (handy to collect the questions somewhere)
" Paste questions
" nnoremap <leader>pq :call PasteQuickfix()<CR>
"
"if !hasmapto('<Plug>Quiz_yourselfPasteQuestions;', 'n')
    "map <unique> <leader>pq <Plug>QuizPasteQuestions;
"endif
"noremap <unique> <script> <Plug>QuizPasteQuestions; <SID>PasteQuickfix
"noremap <SID>PasteQuickfix :call <SID>PasteQuickfix()<CR>

" NOTE multiple questions in a single line not supported
" TODO turn into a function and let people specify their own question marker
if !exists(":SearchQuestions")
    command SearchQuestions :vimgrep /\*Q\*/ %<CR>
endif

if !exists(":PasteQuestions")
    command PasteQuestions :call PasteQuickfix()<CR>
endif

" Suggested mappings that can be overridden
"  nq -> notes quiz for the currently open file
" nnoremap <leader>nq :vimgrep /\*Q\*/ %<CR>


" TODO create a function for searching ALL notes for questions
"
"
"
" Summary of special things to use in a plugin:

" var name		Variable local to the script.

" <SID>			Script-ID, used for mappings and functions local to the script.

" hasmapto()		Function to test if the user already defined a mapping for functionality the script offers.
"
" <Leader>		Value of "mapleader", which the user defines as the keys that plugin mappings start with.
"
" map <unique>		Give a warning if a mapping already exists.
"
" noremap <script>	Use only mappings local to the script, not global mappings.
"
" exists(":Cmd")		Check if a user command already exists.
"
