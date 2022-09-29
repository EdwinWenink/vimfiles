" Mappings to often used folders and docs
" ---------------------------------------

" OS DEPENDENT MAPPINGS

" Windows specific mappings
if has('win32')

    " Open Windows explorer at location of current buffer
    nnoremap <silent> <A-f> :if expand("%:p:h") != "" \| exec "!start explorer.exe" expand("%:p:h:S") \| endif<CR>

    " Open file under cursor with external default problem
    nnoremap gO :!start /B <cfile><CR>

    " Open netrw in folder with blog posts 
    nnoremap <leader>ws :e ~/Documents/personal_website/config.toml<CR>
endif

" Linux specific mappings
if has('unix')
    " TODO adjust the following
    " nnoremap <silent> <A-f> :if expand("%:p:h") != "" \| exec "!start explorer.exe" expand("%:p:h:S") \| endif<CR>
    " Think Unix uses 'open' instead of 'start'?
    " nnoremap gO :!start /B <cfile><CR>
endif 

" Shortcuts to directories
let g:website = "~/Documents/personal_website/"
" TODO automatically open after creation; requires doing this in a function 
command! -nargs=1 NewMicro :execute ":cd" website "| !hugo new -k micro micro/" . strftime("%Y-%m-%d") . "-<args>.md" 
nnoremap <leader>nm :NewMicro 

" Open log
nnoremap <leader>nl :cd ~/Dropbox/Log<CR>:e index.txt<CR>

" Jump to VIMHOME and set as working directory
nnoremap <leader>vh :execute ":cd ".VIMHOME<CR>:e . <CR>

" Calling external program
" ------------------------

" Convert current md to pdf with pandoc
" TODO shellescape on %
nnoremap <leader>pd :!pandoc % -o %:r.pdf<CR>

" Generate ctags
nnoremap <leader>tt :silent !ctags -R . <CR>

" General mappings
" ----------------

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>

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

" Find and list all Markdown headers
nnoremap <leader>h :g/^#/#<CR>

" Open most recently edited file (selects index 1 from :oldfiles)
nnoremap <leader>r `1

" Accept spelling corrections on the fly
" Source: https://castel.dev/post/lecture-notes-1/
inoremap <silent> <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Strip trailing whitespace \ss -> 'strip spaces'
" https://vim.fandom.com/wiki/Remove_unwanted_spaces#Simple_commands_to_remove_unwanted_whitespace
:nnoremap <leader>ss :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Reset syntax highlighting (mnemonic `syntax reset`)
nnoremap <leader>sr :syntax sync fromstart<CR>

" Timestamp
" Invoegen op dezelfde lijn zou beter zijn
"nnoremap <leader>ts i--------------<ESC>:put! =strftime(\"%a %Y/%m/%d\")<CR>i<CR>--------------<CR><Down><Down><ESC>
nnoremap <leader>ts :put! =strftime(\"%Y-%m-%d\t%a\:\")<CR>A

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
