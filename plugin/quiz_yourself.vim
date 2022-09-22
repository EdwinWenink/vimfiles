" ---------------- Quiz yourself ---------------- "
"
" Leave questions to yourself in your notes with *Q* or **Q** markers
" and then collect them in the quickfix list using this plugin. 
"
" Use default quickfix list navigation like `:cnext` and `:cprev` to navigate questions.
" You can also paste them from the quickfix window into a file to print them out.

" TODO turn into a function and let people specify their own question marker
"  nq -> notes quiz for the currently open file
nnoremap <leader>nq :vimgrep /\*Q\*/ %<CR>

" Paste from quickfix list (handy to collect the questions somewhere)
" Paste questions
nnoremap <leader>pq :execute PasteQuickfix()<CR>

:function! PasteQuickfix()
:   for q in getqflist()
:       put=q.text
:   endfor
:endfunction

" TODO create a function for searching ALL notes for questions
"
