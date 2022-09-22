" Mappings to often used folders and docs
" ---------------------------------------

" OS DEPENDENT MAPPINGS

" Windows specific mappings
" TODO

" Open Windows explorer at location of current buffer
" TODO make variant for opening netrw directories
nnoremap <silent> <A-f> :if expand("%:p:h") != "" \| exec "!start explorer.exe" expand("%:p:h:S") \| endif<CR>

" Open file under cursor with external default problem
" Windows version uses start; Unix... open? TODO a OS check
nnoremap gO :!start /B <cfile><CR>

" Unix alternatives of the same mapping
" TODO

" Shortcuts to directories

" Open netrw in folder with blog posts 
nnoremap <leader>ws :e ~/Documents/personal_website/config.toml<CR>

let g:website = "~/Documents/personal_website/"
" TODO automatically open after creation; requires doing this in a function 
command! -nargs=1 NewMicro :execute ":cd" website "| !hugo new -k micro micro/" . strftime("%Y-%m-%d") . "-<args>.md" 
nnoremap <leader>nm :NewMicro 

" ---------------------------------

" Open log
nnoremap <leader>nl :cd ~/Dropbox/Log<CR>:e index.txt<CR>

" Open locallist vertically with custom function
:nnoremap <F4> :Vlist<CR>

" Map F8 to disabling auto indenting
:nnoremap <F8> :setl noai nocin nosi<CR>

" Escaping insert mode the lazy way 
:inoremap jj <Esc>

" Use space to open and close folds
nnoremap <Space> za
vnoremap <Space> za

" More consistent behavior for upper case
nnoremap Y y$

" Keep it centered during search and line joining
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Set undo break points for better undo behavior (do not undo the whole line)
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Close quickfix window
nnoremap <Leader>cl :ccl<CR>

" Accept spelling corrections on the fly
" Source: https://castel.dev/post/lecture-notes-1/
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Reset syntax highlighting (mnemonic `syntax reset`)
nnoremap <leader>sr :syntax sync fromstart<CR>

" Timestamp
iabbrev date- <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
" Invoegen op dezelfde lijn zou beter zijn
"nnoremap <leader>ts i--------------<ESC>:put! =strftime(\"%a %Y/%m/%d\")<CR>i<CR>--------------<CR><Down><Down><ESC>
nnoremap <leader>ts :put! =strftime(\"%Y-%m-%d %a\t\:\")<CR>A

"noremap! <expr> ,Y strftime("%Y")
"noremap! <expr> ,D strftime("%b")

" Disable arrow movement, resize splits instead
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical-resize +2<CR>
nnoremap <Right> :vertical-resize -2<CR>

" Navigate between splits
" Currently vim-tmux-navigation already takes care of this
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-J>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Convert current md to pdf with pandoc
" TODO shellescape on %
nnoremap <leader>pd :!pandoc % -o %:r.pdf<CR>

" Strip trailing whitespace \ss -> 'strip spaces'
" https://vim.fandom.com/wiki/Remove_unwanted_spaces#Simple_commands_to_remove_unwanted_whitespace
:nnoremap <silent> <leader>ss :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
