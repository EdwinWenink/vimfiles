" Edwin's VIM.

" By not specify a path, Plug automatically defaults to `~/.vim/plugged` on Unix
" and to `~/vimfiles/` on Windows.
call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'   " See ~/vimfiles/ultisnip/  and :UltisnipEdit

"File explorers
Plug 'tpope/vim-vinegar'

" Bulk rename files
Plug 'qpkorr/vim-renamer'

" Fuzzy file finding
Plug 'kien/ctrlp.vim'

"Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': { -> fzf#install() }}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Airline bar at bottom of vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Default settings everyone can agree on
Plug 'tpope/vim-sensible'

" Handy mappings
Plug 'tpope/vim-unimpaired'

" Git wrapper
Plug 'tpope/vim-fugitive'

" More useful hlsearch
Plug 'romainl/vim-cool'

" ------------------ CODING/IDE SIMULATION ---------------------------

" Surround with brackets (yss new surroundings, cst" change, ds" delete )
Plug 'tpope/vim-surround'

" Support for using ds, cs and yss with the . command
Plug 'tpope/vim-repeat'

" Autocompletion that only uses native vim autocomplete features
" Plug 'lifepillar/vim-mucomplete'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autocompletion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Deoplete + Jedi
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

" Code formatting
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Flake8 Python Linting
Plug 'nvie/vim-flake8'

" Interactive Programming
" Plug 'williamjameshandley/vimteractive'
" Plug 'cjrh/vim-conda'

" Offline documentation: integration with Zeal
Plug 'KabbAmine/zeavim.vim'

" Javascript syntax
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Autclose bracket-like symbols
" TODO disable autopair for prose style types like .txt and .md 
Plug 'jiangmiao/auto-pairs'

" Graphics shader syntax
" Plug 'tikhomirov/vim-glsl'
" Plug 'beyondmarc/hlsl.vim'

" Git extension for NERDTree
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Run commands without vim in tmux pane with VimuxRunCommand (you are supposed
" to run vim within tmux then)
" Plug 'benmills/vimux'

" Smooth navigation between vim and tmux panels
Plug 'christoomey/vim-tmux-navigator'

" Add shortcuts for efficiently commenting out lines in visual mode (cc to comment out selection, c<space> to toggle comment of line)
Plug 'scrooloose/nerdcommenter'

" Keeps track of git changes
" Plug 'airblade/vim-gitgutter'

" WORKFLOW ----------------------------------

" Vim wiki
" Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki.vim'

" Vim notes
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-misc'

" Todo.txt
Plug 'freitass/todo.txt-vim'

" Plug 'junegunn/vim-journal'

" WRITING ----------------------------------

" Integration of vim with pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'masukomi/vim-markdown-folding' "Because I disabled folding in vim-pandoc for now

" Goyo and limelight for focused writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Markdown 
"Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'godlygeek/tabular'
"Plug 'prashanthellina/follow-markdown-links'  "Press ENTER to follow link
"Plug 'plasticboy/vim-markdown'

Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'

" Latex
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold' "simple regexpr for folding sections

" Autocorrect common typos
" Custom list of iabbrev (1 sec delay on startup)
"Plug 'panozzaj/vim-autocorrect' 
" This plugin just accepts the default Vim suggestion (dangerous?)
"Plug 'sedm0784/vim-you-autocorrect'

" THEME 

" Install theme packages
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'

" Initialize plugin system
call plug#end()

" Mappings to often used folders and docs  ----------------------------------------

" Open netrw in folder with blog posts 
nnoremap <leader>ws :e ~/Documents/personal_website/config.toml<CR>

let g:website = "~/Documents/personal_website/"
" TODO automatically open after creation; requires doing this in a function 
command! -nargs=1 NewMicro :execute ":cd" website "| !hugo new -k micro micro/" . strftime("%Y-%m-%d") . "-<args>.md" 
nnoremap <leader>nm :NewMicro 

" Open AI /th/esis folder
nnoremap <leader>th :e ~/Documents/Artificial\ Intelligence/Master/Thesis-TNO<CR>

" Open AI/master folder
nnoremap <leader>ai :e ~/Documents/Artificial\ Intelligence/Master<CR>

" Open log
nnoremap <leader>nl :cd ~/Dropbox/Log<CR>:e index.txt<CR>


" ----------------------------------- GENERAL SETTINGS -----------------------------------

" Enable modification of buffer contents
set modifiable 

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Set default working directory
"cd ~/Documents/

" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
" Add the current file's directory to the path if not already present.
let s:default_path = escape(&path, '\ ') " store default value of 'path'
" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

" Include subfolders
set path+=**

" Enable spellchecking (':set spell' to enable again)
setlocal spell

" Use multiple spell languages by default
" Set to utf-8 before, otherwise you'll need asci and latin versions as well
set spelllang=en_us,nl

" Accept spelling corrections on the fly
" Source: https://castel.dev/post/lecture-notes-1/
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Set spellfile (errors...)
set spellfile="~/.vim/spell/en.utf-8.add"

" Enable syntax highlighting
syntax on 

" Ignore case in searches
set ignorecase

" Allow switching buffers with unsaved work
set hidden

" Change default 8 column tab to 4 column tab
:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set fold level: max level to fold on opening a file
set foldlevel=1

" Set updatetime of .swp file (changed for faster LaTeX preview).
" Default=4000
" set updatetime=1000
set updatetime=400

" Settings for vim search
set incsearch
set hlsearch

" Automatically re-read files if unmodified in vim
set autoread

" Keep lines above and below the cursor
" set scrolloff=5
set scrolloff=999

" Enable digraph mode for entering special characters. Ä is produced by typing
" A, then backspace, then ':'
" set digraph

" Windows requires unnamed instead of unnamedplus
set clipboard^=unnamed,unnamedplus

" When set, a forward slash is used when expanding file names and backward
" slashes are converted by Vim
set shellslash

" Settings gVim on Windows
if has ('gui_running')
	if has ('gui_win32')
		"set guifont=Courier_New:h10
		set guifont=PragmataPro_Mono_Liga:h11
		" Enable yanking to global clipboard for cross-terminal pasting
		" Disable gui clutter for gVim
		set guioptions-=m  "menu bar
		set guioptions-=T  "toolbar
		set guioptions-=r  "scrollbar
		" Prevent annoying jumping after resizing
		set guioptions-=r
		set guioptions-=L
		"set shell=powershell
        "set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
        set shell=cmd.exe
		" If I want to run Python3.7 commands, do:
		"set shell=bash.exe
		" Windows assumes colon to be part of path names
		" but that breaks references like file.txt:linenumber
		set isfname -=:
	endif
endif

" Enable a colorscheme
" let base16colorspace=256
" colorscheme base16-google-light
set background=light
colorscheme PaperColor

" Highlight current line
set cursorline

" In GUI versions, rely on undercurl for spell errors
" Generally speaking, I don't like background highlighting on errors
highlight SpellBad guibg=NONE
highlight Error guibg=NONE

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" -------------------------------------- GENERAL MAPPINGS --------------------------------------

" Map <F2> to NERDTree
":nnoremap <F2> :NERDTreeToggle<CR>

" Map <F3> to open writer mode
:nnoremap <F3> :Goyo<CR>

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

" Open Windows explorer at location of current buffer
" TODO make variant for opening netrw directories
nnoremap <silent> <A-f> :if expand("%:p:h") != "" \| exec "!start explorer.exe" expand("%:p:h:S") \| endif<CR>
"nmap <F11> :!start explorer /select,%:p

" Generate ctags
nnoremap <leader>tt :silent !ctags -R . <CR>

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>

" Open file under cursor with external default problem
" Windows version uses start; Unix... open? TODO a OS check
nnoremap gO :!start /B <cfile><CR>

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

" ------------------ todo.txt ---------------------------
" extra bindings on top of todo.txt-vim
"
" \td go to todo.xt
" \tc todo capture (bit like Org capture)

let g:todo = "~/Dropbox/todo.txt"

nnoremap <Leader>td :execute ":e" todo<CR>
"nnoremap <Leader>tc :execute ".w >> " . todo
nnoremap <Leader>tc :Capture 

command! -nargs=1 Capture :call CaptureWithLink("<args>")

" Drops todo with date, description and file link at bottom of todo.txt
:function! CaptureWithLink(description)
:       echon '\r'
:       execute 'redir >> ' . g:todo
:       silent echomsg strftime('%Y-%m-%d') a:description fnameescape(expand('%:p')).':'.line('.')
:       silent! redir END
:       echom 'Captured in ' . g:todo
:endfunction

" ------------------ NOTETAKING SYSTEM ---------------------------
"
" Overview of bindings (assuming "\" as leader key)
" All note taking command start with "\n"
" rg executable is assumed for now (I should have regular grep as fallback)
"
" \ni  go to index file (currently tag_index.md)
" \nz  Create a new Zettelkasten entry
" \nu  Call python update script
" \ng  Ngrep
" \nt  Tgrep
" \nv  Vlist
"
" Other useful bindings:
"
" \st  Use CtrlP to search tags (from ctags; TODO can I pass a custom tags file?)
" \tt  Generate ctags for current working directory
" Ctrl-P Ctrl-X  insert markdown link for current search match
"
" TODO Ngrep en tgrep alleen in Zettelkasten laten zoeken MITS ik alle
" notities daarin zet

" Set your note directories here
let g:notes_dir = "C:/Users/Edwin\ Wenink/Documents/Notes/"
let g:zettelkasten = "C:/Users/Edwin\ Wenink/Documents/Notes/"

" 'Notes Grep' with ripgrep (see grepprg)
" -i case insensitive
" -g glob pattern
" ! to not immediately open first search result
command! -nargs=1 Ngrep grep! "<args>" -i -g "*.md" "C:/Users/Edwin Wenink/Documents/Notes/"
" TODO functie maken om fnameescape(notes_dir) te gebruiken; evalueer
" variabele met execute
nnoremap <leader>ng :Ngrep 
" Tips: use :lne(xt) and :lp(revious) or :lopen for navigation.
" The \c escape makes the search case insensitive

" Do a Vimgrep on the current word
" https://vim.fandom.com/wiki/Find_in_files_within_Vim
" map <leader>c :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Variant for searching a tag starting with @
" Prepopulate search with <cword>tag under cursor, but allow replacement
" TODO are optimalizations possible, e.g. stopping search early?
command! -nargs=1 Tgrep grep! "@<args>" -i -g "*.md" "C:/Users/Edwin Wenink/Documents/Notes/"
"nnoremap <leader>t :Tgrep <cword>

" Helper function for calling Tgrep
" If empty string is provided (default), then the word under the cursor 
" is used as the search pattern
" TODO check for rg and use vimgrep as fallback if not present
:function! TagGrep(word)
:	if a:word == ""
:		execute "Tgrep ". "<cword>"
:	else 	
:		execute "Tgrep ". a:word
:	endif
:endfunction

nnoremap <leader>nt :call TagGrep("")<left><left>

" Open local list in a right vertical split (good for Ngrep results)
" Not anymore: I use the quickfix list now
command! Vlist botright vertical copen | vertical resize 50
nnoremap <leader>nv :Vlist<CR>

" open index of my notes and set working directory to notes
nnoremap <Leader>ni :cd ~/Documents/Notes/<CR>
" <cr>:e tag_index.md<cr>

" Quickly create a new entry into the "Zettelkasten" 
" (automatically adds markdown extension)
"nnoremap <leader>nz :e C:/Users/Edwin\ Wenink/Documents/Notes
" TODO take the filename and insert it as the default title on top of the new file
" Have a look at TemplateFallback from lervag/wiki.vim 
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
nnoremap <leader>nz :NewZettel 

" Notes update ('nu'): run python update script
nnoremap <leader>nu :!python "C:\Users\Edwin Wenink\Documents\Notes\update.py"<CR>

" Find and list all Markdown headers
nnoremap <leader>h :g/^#/#<CR>

" Open most recently edited file (selects index 1 from :oldfiles)
nnoremap <leader>r `1

" Suggestions by Jared on my website 
" https://www.edwinwenink.xyz/posts/48-vim_fast_creating_and_linking_notes/#b64351f0-d40d-11ea-a360-6f00b702838a
" nnoremap <buffer> gf f(gf
" my version handles round brackets in link descriptor
nnoremap <buffer> gf f]f(gf 
nnoremap <buffer> <c-w>f f(<c-w>f

" Suggestion by Anton on same post as above
" Find backlinks to current file and open quickfix list with the results  
" command! -nargs=0 Ngrepl :execute 'grep -F "' . ' ]( ' . expand("%:t") . ' )' .  '"' | :copen 1
command! -nargs=0 Ngrepl :execute 'grep! -e "]\(\s?' . expand("%:t") . '\s?\)"' | :clist
nnoremap <leader>nb :Ngrepl<CR>

" Vim wiki in combination with my own notetaking setup

let g:wiki_root = '~/Documents/Notes'
let g:wiki_filetypes = ['md', 'markdown']
let g:wiki_link_extension = '.md'
let g:wiki_link_target_type = 'md'
let g:wiki_index_name = 'wiki'  " No index because index.md will be rendered by Hugo
" Default mappings: |wiki-mappings-default|
" wiki-graph-in
" wiki-link-zotero -> can I make this work with Jabref?
" Also good support for tags; default parser parses tags like :this:
" Can override this with my own convention, or instead switch to this
" has several fzf functions; also CtrlP I think
" g:wiki_map_create_page -> make such that it's consistent with my NewZettel command
" g:wiki_map_link_create -> edit the name of the link
function! TemplateFallback(context)
  call append(0, '# ' . a:context.name)
  call append(1, '')
endfunction

let g:wiki_templates = [
    \ { 'match_func' : {x -> v:true},
    \ 'source_func': function('TemplateFallback')},
    \]



" -------------- CtrlP setup for markdown notes ---------------- "

" CtrlP general settings
let g:ctrlp_match_window = 'bottom,order:ttb'

" Binding for searching tags ("Search Tag")
nnoremap <leader>st :CtrlPTag<CR>

" Binding that is handier e.g. for finding Python classes and definitions
" ("Search Buf tag")
nnoremap <leader>sb :CtrlPBufTag<CR>

" By default search on filenames and not paths
let g:ctrlp_by_filename = 1

" Make CtrlP just use Vim's current working directory
let g:ctrlp_working_path_mode = 0

" Make ctrlp and vimgrep use ripgrep
if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" CtrlP function for inserting a markdown link with Ctrl-X
" Adapted from: https://vi.stackexchange.com/questions/8976/is-there-a-way-to-insert-a-path-of-the-file-instead-of-opening-it-with-ctrlp-plu
function! CtrlPOpenFunc(action, line)
   if a:action =~ '^h$'    
      " Get the filename
      let l:filename = fnameescape(fnamemodify(a:line, ':t'))
      " TODO .md extensie wordt alleen verwijderd als naam NIET begint met een nummer
	  " TODO do not delete "-" when no timestamp is present
	  let l:filename_wo_timestamp = fnameescape(fnamemodify(a:line, ':t:s/^\d\+-\(.*\)\|\.md/\1/'))
      let l:filename_wo_timestamp = substitute(l:filename_wo_timestamp, "_", " ", "g")

      " Close CtrlP
      call ctrlp#exit()
      call ctrlp#mrufiles#add(filename)

      " Insert the markdown link to the file in the current buffer
	  let mdlink = "[ ". l:filename_wo_timestamp . " ]( " . l:filename . " )"
      put=mdlink
  else    
      " Use CtrlP's default file opening function
      call call('ctrlp#acceptfile', [a:action, a:line])
   endif
endfunction

let g:ctrlp_open_func = { 
         \ 'files': 'CtrlPOpenFunc',
         \ 'mru files': 'CtrlPOpenFunc' 
         \ }


" -------------- FZF setup for markdown notes ---------------- "
"  Snippets from comment section: https://www.edwinwenink.xyz/posts/48-vim_fast_creating_and_linking_notes/

" TODO why is this not correctly loaded on startup?

" Fernando (this replicates my CtrlP setup; I only added the fnamemodify again)
function! HandleFZF(file)
    let filename = fnameescape(fnamemodify(a:file, ":t"))
    let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
    put=mdlink
endfunction

" My own setup: l for "link"
command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)
"command! NoteFZF :call fzf#run({'sink': 'HandleFZF'})
command! LinkNoteFZF :call fzf#run({'sink': 'HandleFZF', 'down': '25%'})
"TODO zoek andere mapping dan C-l
"nnoremap <C-l> :LinkNoteFZF<CR>
" <C-o> runs normal command from insert mode and exits back to insert 
" mode afterwards
"inoremap <C-l> <C-o>:LinkNoteFZF<CR>


" hbenevides and frobert
" make_note_link: List -> Str
" returned string: [Title](YYYYMMDDHH.md)
function! s:make_note_link(l)
        " fzf#vim#complete returns a list with all info in index 0
        let line = split(a:l[0], ':')
        let ztk_id = l:line[0]
        try
            let ztk_title = substitute(l:line[2], '\#\+\s\+', '', 'g')
        catch
            let ztk_title = substitute(l:line[1], '\#\s\+', '', 'g')
        endtry
            let mdlink = "[" . ztk_title ."](". ztk_id .")"
            return mdlink
endfunction

" TODO doesn't seem to work great yet; closes window immediately in most cases
" mnemonic link zettel
inoremap <expr> <c-;> fzf#vim#complete(fzf#vim#with_preview({
  \ 'source':  'rg --no-heading --smart-case  ^\#',
  \ 'reducer': function('<sid>make_note_link'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'up':    5}))

" General fzf settings

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS .= ' --inline-info'
" Broken on Windows (not using WSL)
"let g:fzf_preview_window = 'right:60%'

nnoremap <c-k> :Files<cr>


"augroup fzf
  "autocmd!
  "autocmd! FileType fzf
  "autocmd  FileType fzf set laststatus=0 noshowmode noruler
    "\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"augroup END

" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }


" ---------------- Quiz yourself ---------------- "
"  nq -> notes quiz for the currently open file
nnoremap <leader>nq :vimgrep /\*\*Q\*\*/ %<CR>

" Paste from quickfix list (handy to collect the questions somewhere)
" Paste questions
nnoremap <leader>pq :execute PasteQuickfix()<CR>

:function! PasteQuickfix()
:   for q in getqflist()
:       put =q.text
:   endfor
:endfunction


" ---------------- Hide Markdown Links ---------------- "
"  I wanted this feature from plasticboy/vim-markdown
"  Source: https://github.com/plasticboy/vim-markdown/blob/master/syntax/markdown.vim

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setfiletype markdown

" TODO ik snap eigenlijk waarom de link nu goed werkt
" TODO delete; vond toch dat vim-pandoc-syntax did al deed, LOL

" [link](URL) | [link][id] | [link][] | ![image](URL)
" contained online weggehaald voor conceal
"syntax region MarkDownID matchgroup=MarkDownDelimiter start="\[" end="\]" oneline conceal cchar=?
"syntax region MarkDownURL matchgroup=MarkDownDelimiter start="(" end=")" oneline conceal cchar=!
"syntax region MarkDownLink matchgroup=MarkDownDelimiter start="\\\@<!!\?\[\ze[^]\n]*\n\?[^]\n]*\][[(]" end="\]" oneline skipwhite
"highlight! def link MarkDownID Identifier 
"highlight! def link MarkDownURL String 
"highlight! def link MarkDownURL Underlined
"highlight! def link MarkDownDelimiter Delimiter 

" ---------------- WIP ---------------- "

" Mostly old efforts to work with JSON file

" TODO Write function that writes tags to a tags file
" Read all "@" staments in the first n lines of a file (to avoid e.g.
" @Override matching)
" Write them somewhere, but without duplicates
" Result should be sorted
" Potentially follow standard ctags or helptags syntax so that :tags command
" can be used

" TODO Decode JSON tags file using native Vim functions
" I do not know how to pass a file to json_decode
:function! ReadTagsJSON()
":	e C:\Users\Edwin Wenink\Documents\Notes\tags.json
:	let test_dict = json_decode('{"a":["b"]}')
:	echo test_dict.a
:endfunction

" From https://vim.fandom.com/wiki/Append_output_of_an_external_command
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

"TODO I do not know how to avoid these wrapper functions
" Searches JSON index using jq
command! -nargs=1 SearchJSONTags R jq -r ".<args>" "C:\Users\Edwin Wenink\Documents\Notes\tags.json"<CR>
" Wrapper function for making arguments lowercase
:function! IndexTagSearch(tag)
: let l:lower_tag=tolower(a:tag)
: execute "SearchJSONTags " . l:lower_tag
: cd ~/Documents/Notes
:endfunction
nnoremap <leader>nT :call IndexTagSearch("")<left><left>

"TODO e.g. here I would need to find a way to expand the current filename
"TODO replace all references to ~/Documents/Notes with a variable
"expand("%:t") into the command itself...
" Find backlinks to current document
" TODO DOESNT WORK DONT KNOW WHY"
command! -nargs=1 SearchJSONBacklinks R jq -r "<args>" "C:\Users\Edwin Wenink\Documents\Notes\backlinks.json"<CR>
:function! SearchBacklinkJSON()
: execute "SearchJSONBacklinks " . expand("%:t")
: cd ~/Documents/Notes
:endfunction

" Native Vim alternative: search backlinks to current file in backlinks.json
" Only match key values (end with ":")
" Move cursor to first link after finding match
:function! SearchBacklink()
: let current_file=expand("%:t")
: cd ~/Documents/Notes
" Can I combine opening that file with the search?
" Because then the file wouldnt open if the search fails
: e backlinks.json
: execute "normal /" . current_file . ".*:/+1\<CR>w"
:endfunction

"nnoremap <leader>nb : call SearchBacklink()<CR>

" PYTHON ----------------------------------------

" Enable python support on Windows by showing where the .dll is"
" Check which .dll is expected with :version
"let $PYTHONHOME = 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python36-32\'
"let $PYTHONHOME = 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python37-32\'
let $PYTHONHOME = 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python310\'
" Previous line didn't work... so I manually pointed to the python36.dll
"let &pythonthreedll= 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python36-32\python36.dll'
" Next line doesn't work in neovim
"let &pythonthreedll= 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python37-32\python37.dll'
let &pythonthreedll= 'C:\Users\Edwin Wenink\AppData\Local\Programs\Python\Python310\python310.dll'
let g:pymode_python = 'python3'

" Workaround to avoid notifications about imp module being deprecated
if has('python3')
    silent! python3 1
endif

augroup python
	autocmd!
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,cla
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal number
    autocmd FileType python :let python_space_error_highlight = 1
    " Trying to indent comments but doens't seem to work yet; see tip in :help smartindent
    " smartindent causes this problem because in C # is a preprocessor statement
    " In fact, seems to make >> stop working on comments altogether
    " autocmd FileType python inoremap # X#  
    "autocmd FileType python map <buffer> <leader>\fl :call flake8#Flake8()<CR>
	autocmd FileType python set foldmethod=indent foldlevel=99
    autocmd BufWritePost *.py call Flake8()  " Run linter on saving
augroup END

" Flake8 linting
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" Customize markers
let g:flake8_error_marker='x>'
let g:flake8_warning_marker='~>'

" Do not show quickfix (bit too intrusive for my taste)
let g:flake8_show_quickfix=0

" Unset markers ('flake unset' aka 'fuck u')
nnoremap <leader>fu :call flake8#Flake8UnplaceMarkers()<CR>

" Show error message of current line in the rules
" 'flake current'
nnoremap <leader>fc :call flake8#Flake8ShowError()<CR>

" Use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

" Interactive programming
" 1. Start up Vim 8 terminal, load correct environments, load iPython
" 2. Send keys to open session
"       - either current line with <leader>i)
"       - or visual selection with <leader>v)
let g:shellname = 'cmd.exe'  " TODO This setting should not be hardcoded in the future
" NOTE right now I just use the shell variable because for cmd.exe it is the same.
" Does this hold in general and cross platform? Probably not.
" nnoremap <leader>i :y \| :call term_sendkeys(bufnr(&shell), @")<CR>
nnoremap <leader>i :y \| :call term_sendkeys(bufnr(shellname), @")<CR>
" NOTE pasting with autoindent causes indentation issues with pasting
" See: https://ipython.org/ipython-doc/dev/interactive/reference.html#autoindent
" Quick fix: toggle within iPython with %autoindent 
vnoremap <leader>v :y \| :call term_sendkeys(bufnr(&shell), @")<CR>

" Jedi-vim (deoplete + python)
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" Ways of listing Python functions in current file
" :ilist def. *
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

" JAVASCRIPT -------------------------------------- 

augroup javascript
    autocmd!
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
    autocmd Filetype javascript set conceallevel=1
augroup END

" vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

"vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 0 " default 0


" GENERAL PLUGIN SETTINGS -----------------------------
"

" Airline settings
set laststatus=2 
" Avoid showing mode (e.g. -- INSERT -- ) below airline
set noshowmode

" Completion menu
set completeopt+=menuone
set completeopt+=longest
set completeopt+=noselect
"set completeopt+=popup "preview "popup
"
set shortmess+=c "Shut off completion messages
set belloff+=ctrlg "Disable vim beeping during completion

" Deoplete
let g:deoplete#enable_at_startup = 1

" Pass a dictionary to set multiple options
"call deoplete#custom#option({
"\ 'auto_complete_delay': 100,
"\ 'smart_case': v:true,
"\ })

" Auto pairs
" Avoid conflict with Mucomplete
"let g:AutoPairsMapSpace = 0
"imap <silent> <expr> <space> pumvisible()
 "  \ ? "<space>"
 "  \ : "<c-r>=AutoPairsSpace()<cr>"

"let g:AutoPairsMapCR = 0
"imap <Plug>MyCR<Plug>(MUcompleteCR)<Plug>AutoPairsReturn
"imap <cr><Plug>MyCR

" Issue: C-J is defined in imap.vim, but I want to use it with ultisnips and
" multicomplete. Set it to something else
" imap <C-space> <Plug>IMAP_JumpForward

" Ultisnips
" From help mucomplete-compatibility

" Defaults:
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" Not sure whether this is useful
" According to :help , interferes with default binding i_CTRL-X_CTRL-K
let g:UltiSnipsBackwardTrigger = "<s-tab>"

" Expand snippet on selecting mucomplete entry
" inoremap <silent> <expr> <plug>MyCR
     "\ mucomplete#ultisnips#expand_snippet("\<cr>")
" imap <cr> <plug>MyCR

" let g:mucomplete#enable_auto_at_startup = 1 "Toggle with :MUcompleteAutoToggle
" let g:mucomplete#completion_delay = 1

" I seem to have introduced some sort of recursive fallback in the case of
" tex, when a completion is not found.
let g:mucomplete#chains = {
    \ 'default' : ['path', 'omni',  'ulti', 'keyn', 'dict', 'uspl'],
    \ }

" Make dir search (wildmenu) ignore certain files for speedup (could also
" check out ctrlp_custom_ignore)
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Vim easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Shader syntax highlighting
augroup shader
    autocmd!
	autocmd BufNewFile,BufRead *.compute set ft=hlsl
	autocmd BufNewFile,BufRead *.compute set nospell
augroup END

" Zeal offline documentation
" I didn't figure out how to change $ProgramFiles, but it points to x86 which I don't want
let g:zv_zeal_executable = has('win32')
            "\ ? $ProgramFiles . '\Zeal\zeal.exe'
            \ ? 'C:\Program Files\Zeal\zeal.exe'       
            \ : 'zeal'

"nmap gzz <Plug>Zeavim
"vmap gzz <Plug>ZVVisSelection
"nmap <leader>z <Plug>ZVKeyDocset
"nmap gZ <Plug>ZVKeyDocset<CR>
"nmap gz <Plug>ZVOperator
" Following are defaults; above are maps from plugin author
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

let g:zv_file_types = {
            \   'python': 'python_3',
            \   'javascript': 'javascript,nodejs',
            \   'scss': 'sass',
            \   'sh'  : 'bash',
            \   'tex' : 'latex',
            \   'css': 'css,foundation',
            \    '.htaccess'                : 'apache_http_server',
            \    '\v^(G|g)runt\.'           : 'gulp,javascript,nodejs',
            \    '\v^(G|g)ulpfile\.'        : 'grunt',
            \    '\v^(md|mdown|mkd|mkdn)$'  : 'markdown',
            \ }



"------------------------------- MARKDOWN/PROSE SETTINGS -------------------------------

" Define thesaurus files (insert mode <C-x><C-t>)
set thesaurus+=~/.vim/mthesaur.txt

" Settings for limelight with dark background (:help cterm-colors)
"let g:limelight_conceal_ctermfg = 'gray'
"let g:limelight_conceal_ctermfg = 240
"let g:limelight_default_coefficient=0.8

" Settings for limelight with white background (:help cterm-colors)
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient=0.8

" Settings for limelight in combination with gVim
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777' 

" Integrating limelight with Goyo: when Goyo is entered, go in limelight mode
" Show line number only in prose mode
" Upon entering Goyo, make the background light, resembling a paper

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number
  Limelight
  " highlight Normal ctermbg=White
  " highlight Normal ctermfg=Black
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"autocmd! User GoyoEnter highlight Normal ctermfg=Black | highlight Normal ctermbg=White | set number | set bg=light | Limelight

"autocmd! User GoyoLeave Limelight! | set bg=dark | highlight Normal ctermbg=Black | set number!

" Markdown settings
let g:vim_markdown_folding_disabled=1
let g:pencil#wrapModeDefault = 'soft'
let g:pencil_higher_contrast_ui = 1
let g:pencil_terminal_italics = 1

augroup pencil
	autocmd!
	autocmd Filetype markdown,mkd call pencil#init()
	autocmd Filetype text call pencil#init()
augroup END

" Vim-pandoc and vim-pandoc-syntax (E.g. :Pandoc! pdf)
" let g:pandoc#modules#disabled = ["folding"]
" Temporarily disable these because they do not work with Python 3.7
let g:pandoc#modules#disabled = ["bibliographies", "command", "templates","menu"]
let g:pandoc#modules#warn_disabled = 0
let g:pandoc#syntax#conceal#urls = 1

"------------------------------- PANDOC and LATEX styling  -------------------------------

" Use compound pandoc.markdown for best of both worlds
" TODO write a blogpost about this
augroup pandoc
    autocmd!
    autocmd Filetype pandoc,markdown set filetype=pandoc.markdown
    autocmd Filetype pandoc,markdown set conceallevel=1
    autocmd Filetype pandoc,markdown highlight Conceal ctermbg=NONE
    autocmd Filetype pandoc,markdown highlight Folded ctermbg=NONE
    "autocmd Filetype pandoc,markdown call AutoCorrect()
    "autocmd Filetype pandoc,markdown EnableAutocorrect
augroup END

augroup latex
	autocmd!
	autocmd Filetype tex highlight Folded ctermbg=NONE guibg=NONE
    autocmd Filetype tex highlight Conceal ctermbg=NONE guibg=NONE
    "autocmd Filetype tex EnableAutocorrect
augroup END
			
"------------------------------- COMPILING STUFF / LaTeX -------------------------------

" Compile java files from within vim
command Javac !javac $(find . -name "*.java")

" Vimtex
let g:vimtex_enabled = 1
let g:vimtex_view_enabled = 1
let g:vimtex_view_method = 'general'
"let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_general_viewer = 'SumatraPDF'
"let g:vimtex_complete_bib = { 'simple': 1 }
"let g:vimtex_complete_bib = { 'menu_fmt': '[@type] @author_all (@key), "@title"' }

" neovim
let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_compiler_latexmk = {
	\ 'backend' : 'jobs', 
	\ 'background' : 1,
	\ 'build_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 0,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
	\}

" Vimtex toggle TOC
nnoremap <leader>lt :VimtexTocToggle<CR>

" Select Latex Compile Defaults
"filetype plugin indent off
"set shellslash
let g:tex_flavor = "latex"
let g:Tex_BibtexFlavor = 'biber'
"g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
""let g:Tex_DefaultTargetFormat='dvi'
"let g:Tex_MultipleCompileFormats='pdf'
"let g:Tex_ViewRule_pdf='yap -1'
"set runtimepath=~/.vom,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
